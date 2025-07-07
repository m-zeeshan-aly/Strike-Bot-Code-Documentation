---
description: >-
  Strike Bot's weekly lottery rewards active traders with a chance to win the
  accumulated prize pool. This guide explains how the pool works, how to
  qualify, and the drawing process.
---

# Prize Pool System

### **How the Prize Pool Works**

#### **Pool Funding & Fee Structure**

**Transaction Fee Breakdown**: From every trade, Strike Bot charges a 1% platform fee, which is distributed as follows:

* **10% of platform fee** → Prize Pool contribution (0.1% of total trade volume)
* **50% of remaining fee** → Direct referrer commission (if applicable)
* **10% of remaining fee** → Indirect referrer commission (if applicable)
* **Remaining amount** → Platform revenue

**Example**:

* Trade Volume: $1,000
* Platform Fee: $10 (1%)
* Prize Pool: $1 (10% of fee = 0.1% of volume)
* Available for referrals: $9

#### **Prize Distribution System**

**Draw Frequency**: Weekly draws held every Sunday **Winner Selection**: **Top 3 traders** are selected based on total entries earned during the week **Prize Distribution**:

* **1st Place**: 50% of weekly prize pool
* **2nd Place**: 30% of weekly prize pool
* **3rd Place**: 20% of weekly prize pool

> **Note**: This is **NOT a random lottery** - winners are determined by who accumulates the most entries through trading volume and SocialFi activities.

***

### **How to Qualify & Earn Entries**

#### **Trading-Based Entries**

* **Entry Rule**: Every $100 USD in trading volume = 1 entry
* **Minimum Requirement**: $100 USD total volume per week to be eligible
* **Example**:
  * $500 trade volume = 5 entries
  * $1,200 trade volume = 12 entries

#### **SocialFi Reward Entries**

Users can earn **additional entries** through social media engagement:

**Requirements:**

* **Trading Volume**: Minimum $50 USD per week
* **X Account**: Must connect Twitter/X account
* **Submission Limit**: Up to 1-2 entries per week (configurable)

**Ways to Earn SocialFi Entries:**

1. **Repost/Quote Tweet Strike Bot Posts**
   * Find official Strike Bot posts
   * Quote tweet or repost with hashtag #Strike\_Bot⚡️
   * Submit the tweet URL through the bot
   * **Reward**: 1 entry per approved submission
2. **Share PnL Cards**
   * Generate PnL cards from your trading performance
   * Post to X with custom or default caption
   * Include Strike Bot branding and referral
   * **Reward**: 1 entry per approved submission

**SocialFi Entry Process:**

1. Trade minimum $50 USD during the week
2. Connect your X (Twitter) account via OAuth
3. Choose submission type (repost or PnL card)
4. Submit through the bot interface
5. Await admin approval (automatic for valid submissions)
6. Approved entries count toward weekly lottery

***

### **Weekly Selection Process**

#### **Eligibility Criteria**

* **Minimum Trading**: $100 USD volume OR $50 USD + SocialFi entries
* **Active Week**: Must have completed trades during the competition week
* **Account Status**: Must not be blocked from the platform

#### **Winner Determination**

Winners are selected based on **total entries accumulated**:

* **Transaction Entries**: Floor(trading\_volume\_usd / 100)
* **SocialFi Entries**: Approved social media submissions
* **Total Entries**: Transaction entries + SocialFi entries

**Ranking System**:

1. Sort users by total entries (highest first)
2. For ties: Use USD trading volume as tiebreaker
3. Select top 3 eligible users
4. Exclude blocked users from selection

#### **Prize Calculation**

```
Weekly Prize Pool = Sum of all feeBreakdown.prizePoolContribution for the week

1st Place Prize = Weekly Prize Pool × 50%
2nd Place Prize = Weekly Prize Pool × 30%
3rd Place Prize = Weekly Prize Pool × 20%
```

***

### **Example Scenarios**

#### **Scenario 1: Trading Only**

**Your Activity**:

* Week 1 trading: $800 USD volume
* **Entries**: 8 (no SocialFi submissions)
* **Prize Pool**: $50 SOL total for the week
* **Your Position**: 2nd place
* **Prize Won**: $15 SOL (30% of pool)

#### **Scenario 2: Trading + SocialFi**

**Your Activity**:

* Week 1 trading: $300 USD volume (3 entries)
* 1 approved repost (1 entry)
* 1 approved PnL card (1 entry)
* **Total Entries**: 5
* **Prize Pool**: $75 SOL total for the week
* **Your Position**: 1st place
* **Prize Won**: $37.50 SOL (50% of pool)

#### **Scenario 3: SocialFi Minimum**

**Your Activity**:

* Week 1 trading: $75 USD volume (0 transaction entries, but meets SocialFi minimum)
* 2 approved social submissions (2 entries)
* **Total Entries**: 2
* **Prize Pool**: $40 SOL total for the week
* **Your Position**: 3rd place
* **Prize Won**: $8 SOL (20% of pool)

***

### **Prize Delivery**

* **Method**: Automatic SOL transfer to winner's Strike Bot wallet
* **Timing**: Processed after weekly selection (typically Monday)
* **Notification**: Winners receive immediate bot notification
* **Transparency**: Weekly results displayed in Prize Pool dashboard

***

### **Configuration Settings**

The system includes configurable parameters (admin-only):

* **SocialFi minimum trading volume**: Currently $50 USD
* **SocialFi max entries per week**: Currently 1-2 submissions
* **Winner percentages**: 50%/30%/20% split
* **Entry submission types**: Tweet reposts and PnL cards enabled

***

### **FAQ**

❓ **How are winners selected?** → By total entries earned (trading + SocialFi), not random selection.

❓ **Can I increase my chances?** → Yes, trade more volume and submit approved SocialFi content.

❓ **What if I only do SocialFi?** → You need minimum $50 trading + social submissions to qualify.

❓ **How many can win each week?** → Top 3 traders split the weekly prize pool.

❓ **When do I get paid?** → Automatically after weekly selection, typically Monday.

❓ **Can I opt out?** → No, the 0.1% contribution is built into all trades.

❓ **What counts as SocialFi entry?** → Approved reposts of Strike Bot content or PnL card shares on X.

***

_This system rewards both high-volume traders and active community members who help promote Strike Bot through social media engagement._
