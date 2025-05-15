# Referral System

### Overview

The Strike Bot Referral System is a two-level referral network that rewards users for inviting others to the platform. This document details the implementation, workflow, and technical aspects of the referral system.

### Key Features

* **Two-Level Referral Structure**: Direct (Level 1) and indirect (Level 2) referrals
* **Custom Commission Rates**: Admin-configurable commission rates per user
* **Profit-Sharing Model**: Commissions calculated after prize pool contributions
* **Real-Time Tracking**: Immediate commission calculation and crediting

### How It Works

#### 1. User Registration and Referral Setup

When a new user joins the platform:

* They receive a unique referral code/link to share with others
* If they joined via another user's referral link, they are recorded as a direct referral (Level 1) of that user
* The system tracks all referral relationships in the database

**Technical Implementation**

The referral system uses the `Referral` model that tracks:

* User's unique referral code
* Who referred them (`referredBy` and `referredById`)
* Users they have referred (both direct and indirect)
* Custom commission rates (if set by admin)
* Referral status (including if blocked)
* Total rewards earned through the referral program

#### 2. Commission Structure

The commission system follows a profit-share model with the following flow:

1. **Trading Fee**: 1% of the total trading volume
2. **Prize Pool Contribution**: 10% of the trading fee (0.1% of total volume)
3. **Remaining Fee**: After the prize pool contribution, the remaining fee (90% of the trading fee) is Strike's cut
4. **Commission Distribution**:
   * **Level 1 (Direct)**: 50% of Strike's cut (45% of total fee) to the direct referrer
   * **Level 2 (Indirect)**: 10% of Strike's cut (9% of total fee) to the indirect referrer
   * **Platform**: Remaining amount after commissions

**Technical Implementation**

The `Commission` model records each commission payment with:

* Recipient details
* Transaction reference
* Commission amount and tier (1 or 2)
* Payment status tracking

The `Transaction` model includes a detailed fee breakdown showing:

* Total platform fee
* Prize pool contribution
* Direct and indirect referral commissions
* Remaining platform revenue

#### 3. Example Calculation

For a $1,000 trade:

* Trading Fee: 1% of $1,000 = $10
* Prize Pool Contribution: 10% of $10 = $1
* Strike's Cut: $10 - $1 = $9

**Commission Distribution**:

* Direct Referrer (Level 1): 50% of $9 = $4.50
* Indirect Referrer (Level 2): 10% of $9 = $0.90
* Platform Revenue: $9 - $4.50 - $0.90 = $3.60

#### 4. Admin Controls

Administrators can manage the referral system through dedicated controls:

* **Custom Commission Rates**: Admins can adjust the commission rates for individual users (e.g., set direct referral commission to 40% instead of the default 50%)
* **Block Referrals**: Disable specific referral links or block users from earning commissions
* **Analytics & Tracking**: View referral trees, trading volumes, and commission earnings

**Technical Implementation**

The `Referral` model includes fields for:

* `customCommissionRate`: Admin-settable custom rate
* `commissionSetBy`: Admin who set the custom rate
* `commissionSetAt`: When the rate was set
* `isBlocked`: Flag to block commission earnings
* `blockedReason`: Reason for blocking

The system exposes API endpoints for administrators to:

* Get all referrals with filtering options
* Update custom commission rates
* Block/unblock referrals

#### 5. Commission Distribution Flow

1. User executes a trade
2. System calculates trading fee (1%)
3. Prize pool contribution is deducted (10% of fee)
4. System checks if the user was referred:
   * If referred, identify direct referrer
   * Check if direct referrer has a referrer (for Level 2)
5. Calculate commissions for each level:
   * Apply default or custom commission rates
   * Check if referrers are blocked
6. Record commissions in the database
7. Update referral statistics (total rewards, unpaid rewards)

### Data Model

The referral system uses several interconnected database models:

1. **Referral Model**: Tracks referral relationships and statistics
2. **Commission Model**: Records individual commission payments
3. **Transaction Model**: Includes fee breakdown and referral details
4. **Constants Model**: Configurable parameters like default commission rates

### Conclusion

The Strike Bot Referral System is designed to be fair, transparent, and financially sustainable. By implementing a two-level referral structure with a profit-sharing model (after prize pool contribution), it creates a compelling incentive for users to refer others while maintaining platform profitability.

The system balances user rewards with platform revenue, ensuring that all parties benefit from platform growth while avoiding problems associated with deeper multi-level structures.
