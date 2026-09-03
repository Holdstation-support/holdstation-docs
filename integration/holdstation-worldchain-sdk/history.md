# 📖 History

The `History` class from `@holdstation/worldchain-sdk` enables fetching transaction histories (such as sends, receives, swaps) associated with a wallet on WorldChain.

***

## Installation

```bash
npm install @holdstation/worldchain-sdk ethers
```

## Setup

```tsx
import * as sdk from "@holdstation/worldchain-sdk";
import { ethers } from "ethers";

const provider = new ethers.providers.JsonRpcProvider("<YOUR_RPC_URL>");
const managerHistory = new sdk.Manager(provider, 480); // 480 is WorldChain chainId
```

***

## Overall Flow

1. Call `managerHistory.watch(address, callback)`.
2. When new activity is detected, trigger refetch.
3. Call `walletHistory.find(offset, limit)` to retrieve latest transactions.

### 🔗 Full Example on GitHub

*   You can view a full working example here:

    [View history.tsx example](https://github.com/holdstation/worldchain-sdk/blob/HEAD/example/src/pages/history.tsx)

## Watch Real-time Transaction Updates

### 📑 Parameters

| Name       | Type       | Required | Description                                       |
| ---------- | ---------- | -------- | ------------------------------------------------- |
| `address`  | `string`   | ✅ Yes    | Wallet address to monitor.                        |
| `callback` | `function` | ✅ Yes    | Function triggered when new activity is detected. |

***

**ℹ️ Notes:**

* `watch(address, callback)` returns a `{ start, stop }` object.
* You must call `start()` to begin monitoring.
* Always call `stop()` to properly clean up when the component unmounts.

***

## 📘 Usage Example

```tsx
const address = "0x138021392da7fdff698a453c94bf914b5045c3a0";

useEffect(() => {
  let stopRef: any = undefined;

  const fetchTransactionHistory = async () => {
    const { start, stop } = await managerHistory.watch(address, () => {});
    stopRef = stop;
    await start();
  };

  fetchTransactionHistory()
    .then(() => setRefetch((v) => !v))
    .catch((e) => console.error("Error fetching transaction history", e));

  return () => {
    if (stopRef) {
      stopRef();
    }
  };
}, [address]);
```

## Fetch Stored Transaction History

### 📑 Parameters

| Name   | Type   | Required | Description                               |
| ------ | ------ | -------- | ----------------------------------------- |
| offset | number | ✅ Yes    | Starting index for fetching transactions. |
| limit  | number | ✅ Yes    | Maximum number of transactions to fetch.  |

***

## 📘 Usage Example

```tsx
useEffect(() => {
  const fetchAllTransactions = async () => {
    try {
      const offset = 0;
      const limit = 100;
      const fetchedTransactions = await walletHistory.find(offset, limit);
      console.log("fetchedTransactions:", fetchedTransactions);
    } catch (error) {
      console.error("Error fetching transactions:", error);
    }
  };

  fetchAllTransactions();
}, [address, refetch]);

```
