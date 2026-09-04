---
title: "🛠️ Integration Guides"
sidebarTitle: "🛠️ Integration Guides"
---

### 1. Technical Flow & Diagrams

This is the **end-to-end** flow:

1. Login with SIWE → get JWT.
2. (Optional, but recommended) Create API key.
3. Enable Seamless Mode (Smart Trade) via EIP-712.
4. Ensure USD1 allowance is sufficient (`approve` if not).
5. Trade with Seamless Mode (open/close/update).
6. Read trading history & listen to WebSocket feeds.

#### 1.1. High-level state flow

![](/.gitbook/assets/image%20%281%29.png)

Interpretation:

*   **NotLoggedIn**

    No JWT. App must execute SIWE login.
*   **LoggedIn\_NoSeamless**

    JWT exists, but Smart Trade (seamless) is not active.
*   **Seamless\_PendingAllowance**

    Smart Trade is active, but **USD1 allowance** to the trading contract is not yet sufficient.

    → App must check allowance and trigger `approve` when needed.
*   **Seamless\_ReadyToTrade**

    Smart Trade **and** USD1 allowance are both in place.

    → App can call trading APIs without extra signatures.

***

#### 1.2. Detailed sequence diagram

![](/.gitbook/assets/image.png)

### 2. Step-by-Step Guides

Swagger reference for all endpoints:

👉  [perp-api.holdstation.com/docs](https://perp-api.holdstation.com/docs)

#### 2.1. Login with SIWE → get JWT

**Goal:** Obtain a **JWT** bound to the user’s wallet.

**Endpoints**

1. `POST /auth/nonce`
2. `POST /auth/login`

**Summary**

* Call `POST /auth/nonce` with:
  * `wallet`, `chain_id`, `domain`, `version`.
* Build a SIWE message from the response payload.
* Ask the wallet to sign this SIWE message.
* Send `POST /auth/login` with:
  * `address`, `signature`.
* Store:
  * `data.token` (JWT),
  * `data.expired`,
  * `data.wallet_address`.

Use this JWT for all subsequent calls that require **Bearer Auth**.

***

#### 2.2. Create & manage API keys (optional but recommended)

Some endpoints (e.g. **pair info**, **histories**) are protected by **API Key** in addition to JWT.

**Endpoints**

1. `POST /apikey/apikey` – create API key
2. `GET /apikey/apikeys` – list API keys
3. `DELETE /apikey/apikey` – revoke API key

#### 2.2.1. Create an API key

* `POST /apikey/apikey`
* Headers: `Authorization: Bearer <token>`
* Body:

```json
{
  "description": "string"
}
```

* Response `data` contains:
  * `apikey` – the full secret key (show once, store securely),
  * `description`,
  * `preview` – short prefix for display,
  * `wallet_address` – owner wallet.

Use this API key according to the `API Key` security scheme in Swagger

(e.g. header like `x-api-key: <apikey>`).

#### 2.2.2. List API keys

* `GET /apikey/apikeys`
* Headers: `Authorization: Bearer <token>`
* Query:
  * `page` (default 1),
  * `size` (default 10).

Response `data[]` includes fields like `created_at`, `description`, `key_hash`, `preview`, `wallet_address`, etc.

#### 2.2.3. Delete an API key

* `DELETE /apikey/apikey`
* Headers: `Authorization: Bearer <token>`
* Body:

```json
{
  "apikey": "the-key-to-revoke"
}
```

Use this to revoke compromised or unused keys.

***

#### 2.3. Enable Seamless Mode (Smart Trade)

**Goal:** Allow the Forwarder contract to trade on behalf of the user using JWT (no extra signatures per trade).

**Endpoints**

1. `GET /smart-trade/salt`
2. `GET /smart-trade/setting`
3. `POST /smart-trade`
4. `DELETE /smart-trade` (to disable)

**Checklist**

1. `GET /smart-trade/salt`
   * Headers: `Authorization: Bearer <token>`
   * Response: `data.salt`.
2. `GET /smart-trade/setting`
   * Headers: `Authorization: Bearer <token>`
   * Response: `data.forwarder` (Forwarder contract address).
3. Ask wallet to sign EIP-712 typed data:
   *   Domain:

       ```tsx
       {
         name: 'Forwarder',
         version: '1',
         chainId: BigInt(chainId),
         verifyingContract: forwarderAddr
       }
       ```
   *   Types:

       ```tsx
       {
         TradeRequest: [
           { name: 'trader', type: 'address' },
           { name: 'salt', type: 'bytes32' }
         ]
       }
       ```
   *   Value:

       ```tsx
       {
         trader: wallet,
         salt: salt
       }
       ```
4. `POST /smart-trade`

```json
{
  "salt": "0x...",
  "signature": "0x..."
}
```

On success, optionally a new `jwt` and `expired` may be returned – update your stored token if present.

To disable Seamless Mode later, call `DELETE /smart-trade` with the same JWT.

***

#### 2.4. Fetch pair info before trading

**Goal:** Get trading pairs & metadata (pair\_index, symbol, leverage limits, etc.) so that you can:

* Build your trading UI.
* Resolve the correct `pair_index` and other parameters for `/order/open`, `/order/close`, `/order/update`.

**Endpoint**

* `GET /common/pair-info/{chainId}`

**Usage**

* Security:
  * `Authorization: Bearer <token>`
  * API Key (per Swagger’s `API Key` scheme).
* Path:
  * `chainId` – e.g. `56` for BSC.

The response `data` contains:

* `pairs[]` – list of tradable pairs with `pair_index`, symbols, categories…
* `groups` and `contracts` – extra grouping / contract info.
* Other UI-level config.

You should cache this result per chain and refresh periodically.

***

#### 2.5. Trade with Seamless Mode (including USD1 approve)

#### 2.5.1. Prerequisites

Before calling any trade endpoint:

1. User is **logged in** (valid JWT).
2. Seamless Mode is **enabled** for that wallet (`/smart-trade` done).
3. USD1 **allowance** for the trading contract is **sufficient**.

Allowance is **not** handled by the API – you should:

* Trading contract: 0x8E2D60AC9238C46422005C8A8855d2ece37B3f86
* Read it via standard ERC-20 `allowance(trader, trading_contract)` on-chain.
* If `< requiredAmount`, ask the user to send an **`approve`** transaction:
  * `approve(trading_contract, amount)`.
* Wait for confirmation before calling `/order/open`.

#### 2.5.2. Open trade

**Endpoint**

* `POST /order/open`

**Headers**

* `Authorization: Bearer <token>`

**Body**:

```json
{
  "$schema": "<https://example.com/schemas/OpenTradeRequestBody.json>",
  "buy": true,
  "leverage": 150,
  "open_price": "910000000000000", // precision: 10
  "order_type": 0, // 0: maarket, 1: limit, 2: stop
  "pair_index": 0,
  "position_size": "10000000000000000000", // the base usd1 amount to input, decimal 18
  "sl": "920000000000000", // precision: 10
  "tp": "890000000000000", // precision: 10
  "trade_type": "market"
}

```

Key points:

* `pair_index` **must** match one of the pairs from `/common/pair-info/{chainId}`.
* If the call returns non-200, treat as “trade failed” and show appropriate error.

#### 2.5.3. Close trade

**Endpoint**

* `POST /order/close`

**Body** (simplified):

```json
{
  "pair_index": 1,
  "index": 0,
  "trade_type": "market"
}

```

* `index` identifies the user’s open position within that pair.
* Use open-position data (from **WebSocket positions feed**) to choose correct index.

#### 2.5.4. Update SL/TP

**Endpoint**

* `POST /order/update`

**Body**:

```json
{
  "pair_index": 1,
  "index": 0,
  "sl": "11000000000000", // precision: 10
  "tp": "14000000000000" // precision: 10
}
```

You can call this multiple times while the position is open.

***

#### 2.6. Realtime price & order updates

#### 2.6.1. Price WebSocket – realtime price feed

Use this channel to subscribe to **live prices** for pairs, phục vụ hiển thị chart / đặt lệnh:

* **URL:** `wss://pricefeed.holdstation.com/v2`
* **Protocol:** raw text over WebSocket
*   **Message format (per line):**

    ```
    <pair_index>|<price>
    ```

    * `pair_index` – numeric id of the trading pair (same as in `pair-info` API).
    * `price` – last traded / mark price for that pair, as string.
*   **Example messages:**

    ```
    100|87451.94|
    0|87439.12|
    4|1.15222|
    ```
* **Typical usage in frontend:**
  1. Fetch pairs via `GET /common/pair-info/{chainId}` to know `pair_index` for each symbol.
  2. Open WebSocket to `wss://pricefeed.holdstation.com/v2`.
  3. Parse each incoming line, split by `"|"` → update local price store by `pair_index`.
  4. Use this price store for:
     * order ticket (mark/last price),
     * PnL / liquidation bar,
     * price alerts (nếu có).

***

#### 2.6.2. SSE – real-time notifications for open orders

Use this channel **to receive real-time notification for event open position**

* **Endpoint:** `GET /common/realtime`
* **Auth:**
  * `Authorization: Bearer <JWT>` (SIWE token), **and/or**
  * `x-api-key: <API key>` (nếu bạn dùng API key layer).
* **Content-Type:** `text/event-stream` (Server Sent Events – SSE).

#### 2.7. Trading history

**Goal:** Retrieve historical trades (open/close data, fees, PnL, …) to power your History screen or reconciliation.

**Endpoint**

* `GET /common/histories`

**Security**

* `Authorization: Bearer <token>`
* API Key

**Query parameters** (see Swagger for full list):

* `chain_id`
* `page`
* `size`

Response `data[]` includes, for each trade, fields like:

* `created_on_chain_at`, `open_price`, `close_price`,
* `t_position_size_dai`, `collateral`, `leverage`,
* `open_fees`, `close_fees`, `funding_fees`, `rollover_fees`,
* `actual_pnl`, `actual_pnl_percentage`, …

Use this to render history and/or to cross-check trades with your own storage.

***

#### 2.8. Disabling Seamless Mode

When user wants to stop using keyless trading:

* Call `DELETE /smart-trade` with the JWT.
* Consider:
  * Clearing UI flags (`seamlessEnabled = false`).
  * Optionally keeping JWT for non-seamless actions, or logging out completely depending on UX.
