# Commission Service

The Commission Service manages referral commissions and payouts for the Strike Bot. It implements a two-tier referral system with configurable commission rates.

### Commission Structure

* **Prize Pool**: 10% of platform fee
* **Direct Referral (Tier 1)**: 50% of remaining fee after prize pool
* **Indirect Referral (Tier 2)**: 10% of remaining fee after prize pool

### Core Features

* Commission calculation and distribution
* Custom commission rates for specific users
* Automated commission payouts
* Commission tracking and reporting

### Core Methods

```typescript
class CommissionService {
  // Calculate commission breakdown for a trade
  async calculateCommissions(
    tradingFee: number,
    traderId: number,
    referrerId?: number
  ): Promise<CommissionCalculation>

  // Record a commission transaction
  async recordCommission(
    transactionId: string,
    recipientId: number,
    amount: number,
    tier: 1 | 2,
    transactionValue: number
  ): Promise<void>

  // Process commission payouts
  async processCommissionPayouts(
    minThreshold: number = 0.005
  ): Promise<void>

  // Set custom commission rate
  async setCustomCommissionRate(
    telegramId: number,
    rate: number,
    adminId: number
  ): Promise<boolean>
}
```

### Commission Calculation Example

```typescript
const commissionService = new CommissionService();

// Calculate commissions for a trade
const breakdown = await commissionService.calculateCommissions(
  0.1, // 0.1 SOL trading fee
  12345, // trader's Telegram ID
  67890  // referrer's Telegram ID
);

// Example breakdown:
// {
//   tradingFee: 0.1,
//   prizePoolContribution: 0.01, // 10%
//   platformFee: 0.045, // Remaining after commissions
//   referralCommission: {
//     direct: 0.045, // 50% of 0.09
//     indirect: 0 // No indirect referrer
//   }
// }
```

### Database Models

The service uses two main models:

#### Commission Model

```typescript
interface CommissionDocument {
  userId: ObjectId          // Reference to User model
  recipientId: number      // Telegram ID of recipient
  transactionId: string    // Transaction identifier
  amount: number          // Commission amount in SOL
  transactionValue: number // Original transaction value
  tier: 1 | 2            // Commission tier
  paid: boolean          // Payment status
  createdAt: Date
  paidAt?: Date
  paymentTxHash?: string // Payment transaction hash
}
```

#### Referral Model

```typescript
interface ReferralDocument {
  ownerId: number           // Telegram ID
  customCommissionRate?: number  // Custom rate if set
  totalRewards: number     // Total earned commissions
  unpaidRewards: number    // Pending payouts
  paidRewards: number      // Paid commissions
  rewardsWallet?: string   // Payout wallet address
}
```
