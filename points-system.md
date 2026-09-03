---
hidden: true
---

# Points System

## Balance Points

Your staked HOLD balance:

* ≥ 100 HOLD < 1,000 HOLD: 1 Point
* ≥ 1,000 HOLD < 4,000 HOLD: 2 Points
* ≥ 4,000 HOLD < 10,000 HOLD: 3 Points
* ≥ 10,000 HOLD < 20,000 HOLD: 4 Points
* ≥ 20,000 HOLD: 5 Points

The staked HOLD balance is snapshot daily at 00:00 UTC.

Example: 3,500 HOLD staked earns 2 Points daily.

## Volume Points

### Swap Volume on Holdstation Wallet

#### Base Volume

* Starting at $10 in volume: 1 Point
* +1 Point for each doubling of volume (e.g., $20 = 2 Points, $40 = 3 Points, etc.)

| Swap Volume ($) | Base Points |
| --------------- | ----------- |
| $10             | 1 Point     |
| $20             | 2 Points    |
| $40             | 3 Points    |
| $80             | 4 Points    |
| $160            | 5 Points    |
| $320            | 6 Points    |
| $640            | 7 Points    |
| $1,280          | 8 Points    |
| ...and so on    | <p><br></p> |

### **Multipliers**

* **Regular Tokens:** 1.0x points (no multiplier).
* **Whitelisted Tokens:** 2.0x points (e.g., swapping $40 of a whitelisted token yields 6 Points instead of 3).

**Example:** Swapping $100 of a regular token = 4 Points ($80-$160 range). Swapping $100 of a whitelisted token = 4 × 2 = 8 Points.

### Trading Volume on beFuture (Including Leverage):

Volume for beFu

* Starting at $100 in effective volume: 1 Point
* +1 Point for each doubling of volume (e.g., $200 = 2 Points, $400 = 3 Points, etc.)

| Effective Trading Volume ($) | Points      |
| ---------------------------- | ----------- |
| $7,500                       | 1 Point     |
| $15,000                      | 2 Points    |
| $30,000                      | 3 Points    |
| $60,000                      | 4 Points    |
| $120,000                     | 5 Points    |
| $240,000                     | 6 Points    |
| $480,000                     | 7 Points    |
| $960,000                     | 8 Points    |
| ...and so on                 | <p><br></p> |

<br>

* Effective volume on beFuture includes leveraged positions (e.g., a $100 trade with 10x leverage counts as $1,000 in volume).
* Volume is calculated in USD based on the HOLD price at the time of the trade.
* Example: Trading $100 with 10x leverage = $1,000 effective volume = 4 Points ($800-$1,600 range).

#### Combined Volume Points:

* Daily Volume Points = Points from Holdstation wallet (with multipliers applied) + Points from beFuture.
* Example: Swapping $100 of a whitelisted token on Holdstation wallet (8 Points) and trading $100 with 10x leverage on beFuture ($1,000 volume, 4 Points) = 8 + 4 = 12 Volume Points.

## Referral Multipliers for Points

Users with referrals meeting the following thresholds receive a multiplier on their Total Points:

* 10 to 500 Referrals: 1.2x multiplier.
* 501 to 2,000 Referrals: 1.5x multiplier.
* \> 2,000 Referrals: 2.0x multiplier.

### How It Works

* Referrals are counted as the number of new users who sign up and engage (e.g., stake or trade) using your referral link.
* The multiplier is applied to your Total Points after calculating the cumulative sum over 30 days.
* Example: A user with 450 Points and 600 referrals (1.5x multiplier) has their points adjusted to 450 × 1.5 = 675 Points.

### Total Points Calculation

* Daily Points = Balance Points + Volume Points.
* Base Total Points = Cumulative sum of Daily Points over the past 30 days.
* Final Total Points = Base Total Points × Referral Multiplier (if applicable).
* Points Update: Calculated and updated daily at 00:00 UTC.
* Example: If you earn 3 Balance Points (5,000 HOLD staked) and 12 Volume Points ($100 whitelisted swap + $1,000 on beFuture) each day for 30 days, your Daily Points = 15, Base Total Points = 15 × 30 = 450 Points. With 600 referrals (1.5x multiplier), Final Total Points = 450 × 1.5 = 675 Points.

## Points Expiration Rule

* Expiration: Points expire after 30 days from the day they are earned.
* Snapshot: Points are snapshot daily at 00:00 UTC, meaning each day’s points are tracked separately and will expire exactly 30 days later.
* How It Works:
* On Day 1, you earn 15 Points. These 15 Points will expire on Day 31 if not used.
* Your Total Points at any time are the sum of all points earned in the last 30 days (before applying referral multipliers).
* Example: If you earn 15 Points daily for 30 days, your Total Points on Day 30 are 15 × 30 = 450 Points. On Day 31, the Day 1 points (15) expire, and if you earn 15 Points on Day 31, your new Total Points are 450 – 15 + 15 = 450 Points (assuming consistent activity).

## Launchpad Eligibility & Allocation

* Minimum Threshold: You need at least 30 Points to participate in launchpad events.
* This matches the minimum for stakers with 100 to <1,000 HOLD, who earn 1 Point daily (1 × 30 days = 30 Points).

Allocation Formula: Your allocation in the token sale is proportional to your points:

> Allocation = (User’s Final Points / Total Points of All Eligible Users) × Token Sale Amount.

* The more points you have (including referral multipliers), the larger your allocation share.

## Example Allocation

* Total token sale: 1,000,000 tokens.
* Total points of all eligible users: 10,000 Points.
* User A has 675 Points (after 1.5x referral multiplier):
* Allocation = (675 / 10,000) × 1,000,000 = 67,500 tokens.
* User B has 150 Points (no referrals):
* Allocation = (150 / 10,000) × 1,000,000 = 15,000 tokens.

### Additional Notes

* Eligibility: Points determine launchpad participation, with a minimum of 30 Points required.
* No Selling Penalty: Selling HOLD or related tokens does not affect points.
* Transparency: Daily snapshots at 00:00 UTC ensure fairness, with points tracked via a dashboard.

#### Example Scenario

**User A:**

* Staked HOLD: 15,000 HOLD (4 Points).
* Holdstation Wallet Swapping: $128 of a whitelisted token = 4 Points × 2 = 8 Points ($80-$160 range).
* beFuture Trading: $100 with 10x leverage = $1,000 volume = 4 Points ($800-$1,600 range).
* Daily Points: 4 (Balance) + 8 (Holdstation swap) + 4 (beFuture) = 16 Points.
* Base Total Points (30 days): 16 × 30 = 480 Points.
* Referrals: 600 (1.5x multiplier).
* Final Total Points: 480 × 1.5 = 720 Points.
* Allocation (if total points = 10,000, token sale = 1,000,000 tokens):
* (720 / 10,000) × 1,000,000 = 72,000 tokens.

**User B:**

* Staked HOLD: 800 HOLD (1 Point).
* Holdstation Wallet Swapping: $30 of a regular token = 2 Points ($20-$40 range).
* beFuture Trading: $50 with 5x leverage = $250 volume = 2 Points ($200-$400 range).
* Daily Points: 1 (Balance) + 2 (Holdstation swap) + 2 (beFuture) = 5 Points.
* Base Total Points (30 days): 5 × 30 = 150 Points.
* Referrals: 50 (1.2x multiplier).
* Final Total Points: 150 × 1.2 = 180 Points.
* Allocation (if total points = 10,000, token sale = 1,000,000 tokens):
* (180 / 10,000) × 1,000,000 = 18,000 tokens.

**User C:**

* Staked HOLD: 500 HOLD (1 Point).
* Holdstation Wallet Swapping: $20 of a regular token = 2 Points ($20-$40 range).
* beFuture Trading: $20 with 10x leverage = $200 volume = 2 Points ($200-$400 range).
* Daily Points: 1 (Balance) + 2 (Holdstation swap) + 2 (beFuture) = 5 Points.
* Base Total Points (30 days): 5 × 30 = 150 Points.
* Referrals: 3,000 (2.0x multiplier).
* Final Total Points: 150 × 2.0 = 300 Points.
* Allocation (if total points = 10,000, token sale = 1,000,000 tokens):
* (300 / 10,000) × 1,000,000 = 30,000 tokens.

## Summary

* Purpose: Evaluates activity on beFuture (perp DEX) and Holdstation wallet (swap volume) via HOLD staked balance, trading/swap volume, and referrals.

Calculation:

* Balance Points: Based on staked HOLD (e.g., ≥100 HOLD <1,000 = 1 Point, ≥20,000 HOLD = 5 Points).
* Volume Points:
* Holdstation Wallet Swaps: Starts at $10 volume = 1 Point, doubles per tier (e.g., $80 = 4 Points); whitelisted tokens get 2x multiplier.
* beFuture Trading: Starts at $100 effective volume = 1 Point, doubles per tier (e.g., $1,000 = 4 Points); includes leverage.

## Referral Multipliers:

* 10–500 referrals: 1.2x multiplier.
* 501–2,000 referrals: 1.5x multiplier.
* 2,000 referrals: 2.0x multiplier.
* Total Points: Sum of daily points (Balance + Volume) over 30 days × Referral Multiplier, updated at 00:00 UTC.
* Launchpad Eligibility: Minimum 30 Points required.
* Allocation: Proportional to points: (User’s Final Points / Total Points) × Token Sale Amount (e.g., 720 Points / 10,000 Total Points × 1M tokens = 72,000 tokens).
* Notes: No selling penalty; points tracked via dashboard for transparency.

## Why This System Works

* Balanced Points: Swapping and leveraged trading yield fair points, with referral multipliers adding a community growth incentive.
* Referral Impact: Multipliers reward users for bringing in new participants, significantly boosting points and allocation (e.g., User C’s 150 Points become 300 with a 2.0x multiplier).
* Proportional Allocation: Ensures fairness, with higher points (including multipliers) leading to larger token sale shares.
* 30-Day Window: Encourages long-term engagement, with a fair 30-point minimum.
