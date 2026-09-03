# 👋 Introduction

Holdstation **Seamless Mode (Keyless Trading)** allows your users to open/close/update trading positions **without signing every on-chain trade transaction**.

At a high level:

1. **Authentication (SIWE + JWT)**
   * User signs a **Sign-In With Ethereum (SIWE)** message once.
   * Holdstation returns a **JWT** bound to that wallet address.
   * Your app uses this JWT in `Authorization: Bearer <token>` for all protected endpoints.
2. **Smart Trade authorization (EIP-712)**
   * User signs an **EIP-712 typed message** `{ trader, salt }`.
   * This authorizes Holdstation’s **Forwarder** contract to submit trades on their behalf (within app rules) using the Smart Trade flow.
3. **USD1 allowance (on-chain approve)**
   * Before the first trade (or whenever allowance is not enough), user must sign a normal on-chain **`approve(TradingContract, amount)`** transaction for the **USD1 token**.
   * Without this allowance, the trade **cannot** be opened even if Seamless Mode is enabled.
4. **Trading**
   * Your app calls trade APIs (`/order/open`, `/order/close`, `/order/update`) using the JWT.
   * Before sending orders you typically:
     * Fetch **pair metadata** via `GET /common/pair-info/{chainId}` (to resolve `pair_index`, leverage, etc.).
     * Use **WebSocket price feed** (TBD) to show live prices for entry.
   * Closed orders can later be read from **Trading History** via `GET /common/histories`.
5. **API Keys**
   * Some endpoints require both **Bearer Auth** and **API Key**.
   * API keys are managed through:
     * `POST /apikey/apikey`
     * `GET /apikey/apikeys`
     * `DELETE /apikey/apikey`
   * API Key is used as defined in Swagger (security scheme “API Key”).

What Seamless Mode is **not**:

* It does **not** expose, store, or manage user private keys.
* It does **not** bypass user consent:
  * User must explicitly log in via **SIWE**.
  * User must explicitly sign the **EIP-712 message** to enable Smart Trade.
  * User must explicitly sign at least one **on-chain `approve`** for USD1.

Full reference for all endpoints lives in Swagger:

👉 [perp-api.holdstation.com/docs](https://perp-api.holdstation.com/docs)
