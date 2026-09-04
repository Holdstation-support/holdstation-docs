---
title: "❓ FAQ"
sidebarTitle: "❓ FAQ"
description: 'For Merchant & Partner (Last Updated: May 2026)'
---


### User Management & Responsibility

#### Who performs user KYC?

Merchant and Partner are responsible for:

* User onboarding
* Identity verification (KYC)
* AML screening (if applicable)
* Compliance with local regulations

Holdstation processes transactions based on information submitted by Merchant or Partner.

***

#### Who communicates with end users?

Merchant / Partner remains the main point of contact for users, including:

* User support
* Transaction inquiries
* Issue collection
* Payment follow-up

***

#### Is Holdstation responsible for user disputes or fraud cases?

No.

Merchant and Partner are responsible for:

* User verification
* User relationship management
* Fraud monitoring
* Dispute handling

Holdstation may assist in transaction investigations when needed.

***

### Order Management

#### How long is an order valid?

Orders remain valid for **15 minutes** after creation.

If payment is not completed within this period:

* The order expires automatically
* The order can no longer be processed
* A new order must be created

***

#### Can users create multiple orders at the same time?

No.

Each user can only have **one active order** at any given time.

To create another order, users must:

* Complete the current order
* Cancel the current order
* Wait until the current order expires (**15 minutes**)

***

#### How can users create a new order?

Users can:

* Cancel the current order (if supported)
* Wait until the order expires after **15 minutes**

After cancellation or expiration, a new order can be created.

***

### Payment & Settlement

#### What happens if users transfer less crypto than required?

The order will not be processed.

Please contact Holdstation Support for refund assistance and create a new order afterward.

***

#### What happens if users transfer more crypto than required?

The order will not be processed.

Please contact Holdstation Support for refund assistance and create a new order afterward.

***

#### What happens if users transfer using the wrong blockchain network or wrong token?

If users transfer through an unsupported blockchain network or send the wrong token:

* Recovery and refund are not possible
* The order will be considered cancelled

Please carefully verify token and network details before making transfers.

***

#### What happens if payout fails?

Payout orders automatically retry.

If the issue persists, please contact Holdstation Support.

***

#### What happens if users enter incorrect bank information?

Please contact Holdstation Support immediately.

However, if the payout has already been processed, it is highly likely that no further action can be taken.

***

#### Blockchain transaction is confirmed but fiat has not arrived. What should I do?

Please verify:

* Blockchain confirmation status
* Payment verification result
* Payout order status
* Bank processing status

If the issue remains unresolved, please contact Holdstation Support.

***

#### How does commission withdrawal work?

Commission withdrawal requests should be initiated from Merchant / Partner platforms.

After submission:

1. Holdstation reviews the request
2. Settlement records are validated
3. Withdrawal is processed after approval

Processing time may vary.

***

### Pricing & Quotes

#### How is the exchange rate calculated?

Exchange rates are generated dynamically based on market conditions and liquidity at the time of order creation.

***

#### Will the exchange rate change after an order is created?

No.

Once an order is successfully created, the exchange quote is locked during the order validity period (**15 minutes**).

***

#### Does the displayed amount already include fees?

The displayed amount depends on Merchant / Partner configuration.

Applicable fees (if any) may already be included in the final quote shown to users.

***

### Payment & Transfer

#### Can users make multiple transfers for a single order?

No.

Users should complete payment using a **single transfer transaction**.

Multiple transfers for a single order may result in processing failure and require manual investigation.

***

#### Can users transfer from exchanges such as Binance, Bybit, OKX, etc.?

Yes.

Users may transfer funds from supported exchanges, provided the selected:

* Asset
* Blockchain network
* Transfer amount

match the order details exactly.

***

#### Can users cancel an order after payment has already been sent?

No.

Orders cannot be cancelled once payment has already been completed.

***

#### Can users modify bank account information after creating an order?

No.

Users should carefully verify all information before confirming an order.

Changes after order creation are generally not supported.

***

### Processing Time

#### How long does payout usually take?

Most payout transactions are completed within a few minutes.

Actual processing time may vary depending on:

* Blockchain confirmation time
* Banking systems
* Network conditions
* Operational review requirements

***

#### Do weekends or bank holidays affect processing time?

Yes.

Processing time may vary during:

* Bank maintenance periods
* Unexpected banking service interruptions

***

### Compliance & Risk Management

#### Can Holdstation suspend or reject transactions?

Yes.

Holdstation may suspend, review, or reject transactions if unusual activities or compliance concerns are detected.

Examples include:

* Suspicious transaction behavior
* AML concerns
* Compliance requirements
* Technical risks

***

### Support

#### Who should I contact for technical or settlement issues?

Please contact Holdstation Support directly through your dedicated working group with Holdstation.

Please provide:

* Order ID
* Transaction hash (if applicable)
* Timestamp
* Error details
* Related information

***

#### Can Holdstation request additional information?

Yes.

Holdstation may request additional information when necessary for:

* Compliance purposes
* Risk assessment
* Transaction verification

***

## Prefund Model (Partner Only)

The Prefund model works as follows:

#### Step 1 — Deposit USDT

Partner deposits a certain amount of **USDT** to Holdstation in advance.

This amount becomes the Partner's available balance.

***

#### Step 2 — Receive User Funds

When an end user creates an offramp order:

* Partner receives the user's USDT
* Partner handles payment verification

***

#### Step 3 — Create Fiat Payout Request

Partner sends a payout request to Holdstation via API.

The request includes:

* Recipient bank account
* Payout amount
* Required payout details

***

#### Step 4 — Receive Quote

Holdstation creates the fiat payout order and returns quote details.

***

#### Step 5 — Confirm Order

Partner confirms the payout order through API.

After confirmation:

* VND is sent instantly to the specified bank account
* Partner's prefunded USDT balance is deducted accordingly
