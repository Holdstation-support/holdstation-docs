---
title: "💱 Swap"
sidebarTitle: "💱 Swap"
---

This guide demonstrates how to **fetch token data**, **quote**, and **execute token swaps** using the **Holdstation ethers-v5 SDK**.

***

## Installation

```bash
npm install @holdstation/worldchain-sdk \\
            @holdstation/worldchain-ethers-v5 \\
            ethers@^5.8.0
```

***

## Setup

```tsx
import { ethers } from "ethers";
import { Client, Multicall3, Quoter, SwapHelper } from "@holdstation/worldchain-ethers-v5";
import { config, TokenProvider } from "@holdstation/worldchain-sdk";

// 1. Create your JSON‑RPC provider
const RPC_URL = "<https://worldchain-mainnet.g.alchemy.com/public>";
const provider = new ethers.providers.StaticJsonRpcProvider(RPC_URL, {
  chainId: 480,
  name: "worldchain",
});

// 2. Wire up the SDK client
const client    = new Client(provider);
const multicall = new Multicall3(provider);
config.client    = client;
config.multicall3 = multicall;

// 3. Helpers for tokens & swaps
const tokenProvider = new TokenProvider();
const quoter        = new Quoter(client);
const swapHelper    = new SwapHelper(client, { tokenStorage: config.tokenStorage });
```

***

## Contract Address

Include your target contract address in the configuration:

```tsx
const TARGET_CONTRACT = "0x43222f934ea5c593a060a6d46772fdbdc2e2cff0";

```

## Overall Flow

1. **Fetch token metadata** (if you need decimals, symbol, etc.)

```tsx
const info = await tokenProvider.details("0xTokenAddress");
```

1. Preview routes (optional)

```tsx
const route = await quoter.simple(tokenIn, tokenOut);
const smart = await quoter.smart(tokenIn, { slippage: 1, deadline: 300 });
```

1. Get a live quote

```tsx
const quoteParams = {
  tokenIn:  tokenIn,
  tokenOut: tokenOut,
  amountIn: "1.5",
  slippage: "0.5",
  fee:      "0.2",
};
const quote = await swapHelper.quote(quoteParams);
```

1. Execute the swap

```tsx
const swapParams = {
  ...quoteParams,
  tx: {
    data:  quote.data,
    to:    quote.to,
    value: quote.value,
  },
  feeAmountOut: quote.addons?.feeAmountOut,
  feeReceiver:  ethers.constants.AddressZero,
};
const receipt = await swapHelper.swap(swapParams);
console.log("Transaction:", receipt.transactionHash);
```

## Detailed Examples

### Token Metadata

```tsx
// Single token
const tokenInfo = await tokenProvider.details("0xTokenAddress");
console.log(tokenInfo);

// Multiple tokens
const infos = await tokenProvider.details(
  "0xToken1", "0xToken2", "0xToken3"
);
console.log(infos);

```

***

### Quote

#### Simple Quote

```tsx
const simpleQuote = await quoter.simple(
  "0xWETH",
  "0xUSDC"
);
console.log(simpleQuote.best);
```

#### Smart Quote

```tsx
const smartQuote = await quoter.smart("0xWETH", {
  slippage: 2,       // 2%
  deadline: 120,     // seconds
});
console.log(smartQuote.quote);
```

***

### SwapParams Interfaces

#### Quote Input

| Name     | Type     | Required | Description                         |
| -------- | -------- | -------- | ----------------------------------- |
| tokenIn  | `string` | ✅        | Address of input token              |
| tokenOut | `string` | ✅        | Address of output token             |
| amountIn | `string` | ✅        | Amount of input token (human units) |
| slippage | `string` | ✅        | Max slippage in % (e.g. `"0.3"`)    |
| fee      | `string` | ✅        | Platform fee in % (e.g. `"0.2"`)    |

#### Swap Input

| Name         | Type     | Required | Description                                    |
| ------------ | -------- | -------- | ---------------------------------------------- |
| tokenIn      | `string` | ✅        | Address of input token                         |
| tokenOut     | `string` | ✅        | Address of output token                        |
| amountIn     | `string` | ✅        | Amount of input token                          |
| tx           | `object` | ✅        | `{ data, to, value }` from `quote()`           |
| fee          | `string` | ✅        | Fee in %                                       |
| feeAmountOut | `string` | ❌        | Absolute fee taken from output (optional)      |
| feeReceiver  | `string` | ✅        | Address to receive fee (`AddressZero` if none) |

***

### Full Example & Further Reading

For a complete, end‑to‑end swap example, and to explore all available methods, check out the SDK repo and docs:

🔗 **Documentation & Examples**

[https://www.npmjs.com/package/@holdstation/worldchain-sdk](https://www.npmjs.com/package/@holdstation/worldchain-sdk)
