---
title: "👁️ Tokens and Balances"
sidebarTitle: "👁️ Tokens and Balances"
---

The <mark style="color:red;">`TokenProvider`</mark> class from <mark style="color:red;">`@holdstation/worldchain-sdk`</mark> enables developers to interact with token metadata, balances, and wallet holdings on WorldChain.

![](/.gitbook/assets/image%20%284%29.png)

## Installation

```bash
npm install @holdstation/worldchain-sdk ethers
```

***

## Setup

```tsx
import { ethers } from "ethers";
import { TokenProvider } from "@holdstation/worldchain-sdk";

const provider = new ethers.providers.JsonRpcProvider("<YOUR_RPC_URL>");
const tokenProvider = new TokenProvider({ provider });
```

***

## Get Token Metadata

### 📑 Parameters

| Name   | Type                     | Required | Description                                                                                    |
| ------ | ------------------------ | -------- | ---------------------------------------------------------------------------------------------- |
| tokens | `string[]` (rest params) | ✅ Yes    | One or more token addresses passed as separate arguments (e.g. `details(token1, token2, ...)`) |

### 📘 Usage

```tsx
const WETH = "0x4200000000000000000000000000000000000006";
const USDCe = "0x79A02482A880bCE3F13e09Da970dC34db4CD24d1";

const details = await tokenProvider.details(WETH, USDCe);

console.log(details[WETH]);   // { address, chainId, decimals, symbol, name }
console.log(details[USDCe]);  // { address, chainId, decimals, symbol, name }
```

***

## Get All Tokens Held by a Wallet

### 📑 Parameters

| Name   | Type     | Required | Description                                                           |
| ------ | -------- | -------- | --------------------------------------------------------------------- |
| wallet | `string` | ✅ Yes    | Wallet address to find associated token contracts via Transfer events |

### 📘 Usage

```tsx
const wallet = "0x14a028cC500108307947dca4a1Aa35029FB66CE0";
const tokens = await tokenProvider.tokenOf(wallet);

console.log(tokens); // Array of token contract addresses
```

***

## Get Balances of Multiple Tokens for One Wallet

### 📑 Parameters

| Name   | Type       | Required | Description                                |
| ------ | ---------- | -------- | ------------------------------------------ |
| wallet | `string`   | ✅ Yes    | Wallet address to get token balances for   |
| tokens | `string[]` | ✅ Yes    | Array of token addresses to check balances |

### 📘 Usage

```tsx
const balances = await tokenProvider.balanceOf({
  wallet: "0x14a028cC500108307947dca4a1Aa35029FB66CE0",
  tokens: [WETH, USDCe, WLD],
});

console.log(balances[WETH]);
console.log(balances[USDCe]);
console.log(balances[WLD]);
```

***

## Get Balance of a Single Token for Multiple Wallets

### 📑 Parameters

| Name    | Type       | Required | Description                                               |
| ------- | ---------- | -------- | --------------------------------------------------------- |
| token   | `string`   | ✅ Yes    | Token address to check balances of                        |
| wallets | `string[]` | ✅ Yes    | Array of wallet addresses to fetch balances for the token |

### 📘 Usage

```tsx
const balances = await tokenProvider.balanceOf({
  token: WLD,
  wallets: [
    "0x14a028cC500108307947dca4a1Aa35029FB66CE0",
    "0xc57B9e6f74d393504b7e43C09A6089aEc6f8D6d0"
  ],
});

console.log(balances["0x14a028..."]);
console.log(balances["0xc57B9e6..."]);
```
