# Weekly Prize Pool System

### Overview

The Strike Bot Weekly Prize Pool System is a key component of the platform's engagement strategy. It allocates a portion of all trading fees to a weekly prize pool that is distributed to top users every Sunday at 7 PM EST. This document details the implementation, workflow, and technical aspects of the prize pool system.

### Key Features

* **Automatic Fee Allocation**: 10% of all trading fees contribute to the prize pool
* **Weekly Distribution**: Prize pool is drawn every Sunday at 7 PM EST
* **Top Trader Rewards**: Top 3 traders by volume earn prizes
* **Volume-Based Entries**: Trading volume determines chance of winning
* **Transparent Tracking**: Users can view current prize pool and their entries

### How It Works

#### 1. Prize Pool Contribution

Every time a trade occurs on the platform:

* The system calculates a trading fee (1% of transaction volume)
* 10% of this fee (0.1% of total volume) is allocated to the weekly prize pool
* The prize pool amount accumulates in real-time throughout the week

**Technical Implementation**

The `Transaction` model records each transaction with a detailed fee breakdown:

* `transactionFee`: 1% of the transaction amount
* `feeBreakdown.prizePoolContribution`: 10% of the transaction fee
* The contribution is calculated at transaction time

#### 2. Weekly Prize Pool Cycle

The weekly prize pool follows this cycle:

1. **Accumulation Phase**: Monday 00:00 UTC to Sunday 23:59 UTC
2. **Draw Date**: Every Sunday at 7 PM EST
3. **Winner Selection**: System identifies top 3 users by trading volume
4. **Prize Distribution**: Winners receive their share of the prize pool
5. **Reset**: The prize pool resets to 0 for the next week

**Technical Implementation**

The `WeeklyWinners` model stores:

* Week start and end dates
* Winner details (position, userId, winning amount, percentage)
* Each week is uniquely identified by its date range

#### 3. Winner Selection Process

At the end of each week, the system:

1. Calculates each user's total trading volume for the week
2. Orders users by their trading volume (specifically the USD value)
3. Filters out users with less than $100 in trading volume
4. Excludes any blocked users
5. Selects the top 3 users by volume
6. Assigns "entries" based on USD trading volume ($100 = 1 entry)

**Technical Implementation**

The `getWeeklyTransactions` function:

* Aggregates transaction data by week
* Calculates total prize pool contribution, transaction count, and volume
* Identifies top 3 users by volume and their entry count
* Filters out users with less than $100 in volume and blocked users

#### 4. Prize Distribution

The prize pool is distributed among the top 3 traders according to these percentages:

1. First Place: Receives the percentage defined in `winnerFirstWinPercentage` (typically largest share)
2. Second Place: Receives the percentage defined in `winnerSecondWinPercentage` (typically medium share)
3. Third Place: Receives the percentage defined in `winnerThirdWinPercentage` (typically smallest share)

The exact percentages are configurable in the system constants.

**Technical Implementation**

The `postWeeklyWinners` function:

1. Gets the week's transaction data
2. Identifies the top 3 users
3. Calculates prize amounts based on configured percentages
4. Uses the `sendSolanaToWinner` function to transfer SOL to winners' wallets
5. Records the winners and prizes in the `WeeklyWinners` model

#### 5. User Interface

Users can access prize pool information through the "Weekly Draw" button on the main menu, which shows:

* Current prize pool amount
* User's entries for the current week
* Countdown to the next draw
* Previous winners and their prizes

#### 6. Technical Implementation Details

**Solana Transfer Process**

When prizes are distributed, the system:

1. Uses the admin wallet to send SOL to winners
2. Includes retry logic for transaction confirmation
3. Maintains a buffer amount to ensure transaction fees can be covered
4. Records transaction signatures for verification

**Example Calculation**

For a total weekly prize pool of 10 SOL with configured percentages of 60%/30%/10%:

* First Place: 6 SOL (60% of pool)
* Second Place: 3 SOL (30% of pool)
* Third Place: 1 SOL (10% of pool)

**Weekly Tracking**

The system tracks:

1. Each week's start and end dates (Monday 00:00 UTC to Sunday 23:59 UTC)
2. Total prize pool contribution for the week
3. Total transaction count and volume
4. Top 3 users by volume and their statistics
5. Historical winners data with pagination and filtering options

#### 7. Data Model

The weekly prize pool system uses several interconnected database models:

1. **Transaction Model**: Records individual transactions with prize pool contributions
2. **WeeklyWinners Model**: Stores weekly winners and prize distributions
3. **Constants Model**: Contains configurable parameters for winner percentages
4. **User Model**: References user information including blocked status

### Conclusion

The Strike Bot Weekly Prize Pool System provides a transparent and engaging mechanism to reward active traders on the platform. By contributing a portion of every transaction to the prize pool, the system ensures that the most active users are recognized and rewarded, encouraging higher platform engagement and trading volume.

The weekly distribution schedule, clear entry mechanism, and transparent tracking create a compelling game-like element that enhances the overall user experience while maintaining fairness and technical robustness.
