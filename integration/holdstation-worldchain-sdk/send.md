---
title: "⏫ Send"
sidebarTitle: "⏫ Send"
---

The `Sender` class from `@holdstation/worldchain-sdk` allows developers to send native tokens (e.g., ETH) or ERC20 tokens on WorldChain easily.

***

## Installation

```bash
npm install @holdstation/worldchain-sdk ethers
```

***

## Setup

```tsx
import { ethers } from "ethers";
import { Sender } from "@holdstation/worldchain-sdk";

const provider = new ethers.providers.StaticJsonRpcProvider("<YOUR_RPC_URL>", {
  chainId: 480,
  name: "worldchain",
});
const sender = new Sender(provider);
```

***

## Send Token

### 📑 Parameters

***

| Name     | Type     | Required   | Description                                                               |
| -------- | -------- | ---------- | ------------------------------------------------------------------------- |
| `to`     | `string` | ✅ Yes      | Recipient wallet address.                                                 |
| `amount` | `number` | ✅ Yes      | Amount to send (expressed in normal units, not wei).                      |
| `token`  | `string` | ❌ Optional | ERC20 token contract address. If omitted, sends native token (e.g., ETH). |

***

**ℹ️ Notes:**

* If `token` is **omitted**, the SDK will send **native tokens** like ETH.
* If `token` is **provided**, the SDK will send **ERC20 tokens**.
* `amount` should be entered as a human-readable number (e.g., `0.1` ETH, `10` Tokens).
* The conversion to correct base units is handled internally.

***

## 📘 Usage Examples

***

### 🔹 Send Native Token (e.g., ETH)

```tsx
import { ethers } from "ethers";
import { Sender } from "@holdstation/worldchain-sdk";

const provider = new ethers.providers.StaticJsonRpcProvider("<YOUR_RPC_URL>", {
  chainId: 480,
  name: "worldchain",
});
const sender = new Sender(provider);
const amount = 0.1; // 0.1 ETH
const receiver = "0xAddress";
const result = await sender.send({ amount, to: receiver });
console.log("result:", result);
```

***

### 🔹 Send ERC20 Token

```tsx
const tokenAddress = "0xTokenAddress";
const amount = 10; // 10 Tokens
const receiver = "0xAddress";
const result = await sender.send({ amount, token: tokenAddress, to: receiver });
```

***

## ⚠️ Typical Error Cases

| Error                     | Possible Cause                                                                         | How to Fix                                                                                                |
| ------------------------- | -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `insufficient funds`      | Wallet does not have enough native token to pay for gas or the transfer amount.        | Ensure the sender wallet has enough native balance (e.g., ETH) to cover both gas fee and transfer amount. |
| `insufficient allowance`  | Trying to send ERC20 token but no prior approve() call made or allowance is too small. | Make sure the sender has granted sufficient allowance to the token contract via `approve()` beforehand.   |
| `invalid address`         | The `to` address or `token` address is incorrectly formatted.                          | Verify that all addresses are valid Ethereum addresses (start with `0x` and 42 characters long).          |
| `transaction underpriced` | Gas fee settings are too low.                                                          | Retry with higher gas price or gas limit depending on network congestion.                                 |
| `execution reverted`      | Smart contract rejected the transfer (e.g., paused token, blocked address).            | Check token smart contract status and address restrictions.                                               |
