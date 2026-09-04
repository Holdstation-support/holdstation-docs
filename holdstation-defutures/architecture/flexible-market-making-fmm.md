---
title: "💹 Flexible Market Making (FMM)"
sidebarTitle: "💹 Flexible Market Making (FMM)"
---

Holdstation DeFutures Flexible Market Making (FMM) model, **inspired by Dodo Proactive Market Making Model.** Unlike traditional models, Holdstation FMM applies **funding fees in blocks** across **all assets**—including **perpetual futures for crypto, commodities, forex, and more**.

The system is powered by a **single smart contract** that handles both **pricing and funding fee logic**, eliminating complexity and ensuring **streamlined, capital-efficient trading**.

With its **general-purpose trading pool**, Holdstation FMM creates a **simpler, more efficient market-making structure**, reducing overhead while maximizing liquidity and trader experience.

**Holdstation DeFutures FMM algorithm works as follows:**

> **Info**
>
> **P** is used below to represent **the current mark price of the asset being traded.** The mark price is the reference price for determining profit and loss, and is determined by an oracle (a trusted data source that feeds price information into the blockchain). When the net position is 0 (i.e. the number of long positions equals the number of short positions), the mark price equals the index price fed by the oracle. However, when there is a trade, the mark price can change based on the size and direction of the trade.
>
> **x** is the total trade size of total position

* FMM algorithm maintains equilibrium when the net position is 0 (non long-short users paid funding fee)
* The mark price equals the index price fed by the dynamic price feed.
* Trades push the mark price toward the specific trading direction.
* The price change due to the trade is proportional to the trade size x.
* The mark price is pushed proportionally to formula include P (call spread), with a determined by the available open interest

$$
P + ∆P, where ∆P = a • x
$$

* The trading volume pushes the mark price linearly.
* The precise collateral size is calculated by the deduce the trading cost (leverage, collateral) - more details available in [Protocol Fee](../defuture-fees/)
* The price spread and the mark price are determined by the total net position.

The funding fee will calculate by individual blocks time, and determine the funding fees when the users close the orders.

