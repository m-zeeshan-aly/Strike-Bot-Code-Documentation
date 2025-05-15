# Database Configuration

### Connection Setup

```typescript
// MongoDB connection with basic configuration
import mongoose from 'mongoose'

await mongoose.connect(env.MONGO_URI, {
      dbName: env.MONGO_DB_NAME,
})
```

### Environment Variables

* `MONGO_URI` (Required): MongoDB connection string
  * Default: none, must be provided
  * Example: `mongodb://username:password@host:port/database`

### Available Models

1. **User Model**
   * Core user information
   * Tracks transactions and referrals
   * Indexes: `telegramId`, `username`, `isActive`
2. **Transaction Model**
   * Buy/Sell transactions
   * Fee calculations
   * Indexes: `userId`, `transactionId`, `status`
3. **Settings Model**
   * User preferences
   * Trading parameters
   * Index: `telegramId`
4. **Referral Model**
   * Referral tracking
   * Commission management
   * Indexes: `code`, `ownerId`
5. **Wallet Model**
   * User wallets
   * Encrypted keys
   * Index: `userId`

### Schema Example (Transaction)

```typescript
{
  userId: ObjectId,
  transactionId: String,
  type: ['buy', 'sell'],
  amount: Number,
  status: ['pending', 'executed', 'completed', 'failed'],
  feeBreakdown: {
    platformFee: Number,
    prizePoolContribution: Number
  }
}
```

### Performance Optimizations

1. **Indexes**
   * Unique indexes on critical fields
   * Compound indexes for queries
   * Status-based indexes for monitoring
2. **Validation Rules**
   * Required fields enforcement
   * Type checking
   * Value range validation
   * Custom validators

### Connection Options

```typescript
const options = {
  dbName: 'volume-bot',
  autoIndex: true,
  serverSelectionTimeoutMS: 5000,
  socketTimeoutMS: 45000,
}
```

### Error Handling

```typescript
try {
  await mongoose.connect(env.MONGO_URI)
  console.warn('Connected to MongoDB')
} catch (err) {
  console.error('MongoDB connection failed')
  process.exit(1)
}
```

### Best Practices

1. Use environment variables for credentials
2. Enable validation on all schemas
3. Create indexes for frequently queried fields
4. Implement proper error handling
5. Use transactions for critical operations
