---
hidden: true
---

# ⛽ Holdstation Gas Station

> **Info**
>
> Holdstation offers a **free service** **to support all dApps looking to integrate zkSync Paymaster!** It's our way of helping the zkSync community thrive together!

Account Abstraction, a core technology that enriches user-friendly experiences and security, is at the heart of what we do at Holdstation. We share a similar vision with Vitalik and are here to support growth together.

With the[ zkSync account abstraction paymaster](https://era.zksync.io/docs/reference/concepts/account-abstraction.html#paymasters), Holdstation empowers all dApps to pay gas using any tokens available, making transactions smoother and more user-friendly.

The gas price depends on the gas estimation in ETH, and can be paid by:

1. [USDT](https://explorer.zksync.io/address/0x493257fD37EDB34451f62EDf8D2a0C418852bA4C)
2. [USDC](https://explorer.zksync.io/address/0x3355df6D4c9C3035724Fd0e3914dE96A5a83aaf4)
3. dApp token (we can support)

### How to Integrate with Holdstation Gas Station?

Follow our Paymaster Contract Address:[ 0x8a71416F2BCBd428c3Fc4284404617B139C0181C](https://explorer.zksync.io/address/0x8a71416F2BCBd428c3Fc4284404617B139C0181C)

Kindly note the following code is our sample. We encourage you to reach out to our dedicated Dev team for assistance. Your seamless integration is our priority!

> **Info**
>
> Paymaster sample for EOA Wallet

```
//// PAYMASTER with EOA Wallet

import { Contract, Provider, types, utils, Wallet } from 'zksync-web3';
import { ethers } from 'ethers';

const PAYMASTER_ADDRESS = '0x8a71416F2BCBd428c3Fc4284404617B139C0181C'
const provider = new Provider(RPC_URL);
const signer = new Wallet(PRIVATE_KEY, provider);
const contract = new Contract(CONTRACT_ADDRESS, CONTRACT_ABI, provider)

// method: approve, swap
// ACCOUNT: public address
const populateContract = await contract.populateTransaction[method](...params, {
      from: ACCOUNT,
});

const gasLimit = await provider.estimateGas({ ...populatedTx, from: ACCOUNT });
const gasPrice = await provider.getGasPrice();


// TOKEN_ADDRESS: token pay gas erc20
const paymasterParams = utils.getPaymasterParams(PAYMASTER_ADDRESS, {
  type: "ApprovalBased",
  TOKEN_ADDRESS,
  minimalAllowance: ethers.BigNumber.from(1),,
  innerInput: new Uint8Array(),
});

populatedTx.customData = {
  gasPerPubdata: utils.DEFAULT_GAS_PER_PUBDATA_LIMIT
  paymasterParams,
};

const sentTx = await signer.sendTransaction({
  ...populatedTx,
  maxFeePerGas: gasPrice,
  maxPriorityFeePerGas: BigNumber.from(0),
  gasLimit,
});
```

> **Info**
>
> Paymaster sample for Account Abstraction Wallet

```
//// PAYMASTER with AA Wallet

import { Contract, Provider, types, utils, Wallet } from 'zksync-web3';
import { ethers } from 'ethers';

const PAYMASTER_ADDRESS = '0x8a71416F2BCBd428c3Fc4284404617B139C0181C'

const provider = new Provider(RPC_URL);
const signer = new Wallet(PRIVATE_KEY, provider);
const contract = new Contract(CONTRACT_ADDRESS, CONTRACT_ABI, provider)

// method: approve,swap
// ACCOUNT: public address
const populateContract = await contract.populateTransaction[method](...params, {
      from: ACCOUNT,
});

const gasLimit = await provider.estimateGas({ ...populatedTx, from: ACCOUNT });

const paymasterParams = utils.getPaymasterParams(PAYMASTER_ADDRESS, {
  type: "ApprovalBased",
  TOKEN_ADDRESS,
  minimalAllowance: ethers.BigNumber.from(1),
  innerInput: new Uint8Array(),
});

populatedTx.customData = {
  ...populatedTx.customData,
  paymasterParams: paramsPaymaster,
};

populatedTx.gasLimit = gasLimit;
populatedTx.maxFeePerGas = await provider.getGasPrice();
populatedTx.maxPriorityFeePerGas = ethers.BigNumber.from(0);
populatedTx.chainId = parseInt(CHAIN_ID);
populatedTx.from = ACCOUNT;
populatedTx.nonce = await provider.getTransactionCount(ACCOUNT);
populatedTx.type = 113;
populatedTx.value = ethers.BigNumber.from(0);
populatedTx.customData = {
  ...populatedTx.customData,
  gasPerPubdata: utils.DEFAULT_GAS_PER_PUBDATA_LIMIT,
} as types.Eip712Meta;

const signature = ethers.utils.arrayify(ethers.utils.joinSignature(await signer.eip712.sign(populatedTx)));
populatedTx.customData = {
  ...populatedTx.customData,
  customSignature: signature,
};

const sendTx = await provider.sendTransaction(utils.serialize(populatedTx));
```
