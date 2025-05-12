# System Design

#### Table of Contents

1. Architecture Overview
2. Core Components
3. Data Models
4. Service Layer
5. Integration Points
6. Transaction Flow
7. System Requirements

#### Architecture Overview

Strike Bot is a Telegram-based trading bot for Solana blockchain with the following architectural components:

* **Bot Layer**: Grammy-based Telegram bot handling user interactions
* **Service Layer**: Core business logic for trading and transactions
* **Data Layer**: MongoDB for persistence, Redis for sessions/queues
* **Blockchain Layer**: Solana integration via Web3.js and Jupiter

**Key Features**

* Token trading (buy/sell)
* Limit orders
* Position tracking
* Referral system
* Prize pool system
* Transaction fee distribution

#### Core Components

**1. Bot Features (`src/bot/features/`)**

* `trade.feature.ts`: Core trading interface
* `buyToken.feature.ts`: Buy operations
* `sellToken.feature.ts`: Sell operations
* `positions.feature.ts`: Portfolio management
* `limitOrder.feature.ts`: Limit order handling

**2. Services (`src/bot/services/`)**

* `executeSwap.service.ts`: Transaction execution
* `tokenTransaction.service.ts`: Transaction tracking
* `limitOrder.service.ts`: Order management
* `prizePool.service.ts`: Prize pool operations
* `referral.service.ts`: Referral management

#### Data Models

**Transaction Model**

```typescript
interface TransactionDocument {
  userId: ObjectId
  transactionId: string
  signature: string
  type: 'buy' | 'sell'
  tokenAddress: string
  amount: number
  valueUsd?: number
  transactionFee: number
  feeBreakdown: {
    platformFee: number        // 1% of transaction
    prizePoolContribution: number   // 10% of platform fee
    directReferralCommission: number // 50% of remaining
    indirectReferralCommission: number // 10% of remaining
    platformRevenue: number
  }
  status: 'pending' | 'executed' | 'completed' | 'failed'
}
```

**Fee Distribution Flow**

1. Platform Fee: 1% of transaction value
2. Prize Pool: 10% of platform fee
3. Referral Commission:
   * Direct: 50% of remaining
   * Indirect: 10% of remaining
4. Platform Revenue: Remaining amount

#### Service Layer

**Transaction Service**

* Handles transaction recording and fee calculations
* Manages transaction state transitions
* Integrates with referral and prize pool systems

**Order Execution Flow**

```typescript
async function executeSwapTransaction(
  userId: string,
  params: SwapTransactionParams
): Promise<SwapTransactionResult> {
  // 1. Validate parameters
  // 2. Check balances
  // 3. Execute swap via Jupiter
  // 4. Record transaction
  // 5. Process fees & commissions
  // 6. Update prize pool entries
}
```

#### Integration Points

**1. Blockchain Integration**

* **Solana Connection**: Via `@solana/web3.js`
* **Jupiter Aggregator**: For optimal swap routing
* **QuickNode RPC**: High-performance node access

**2. Price Feeds**

* DexScreener API for real-time prices
* Price monitoring for limit orders
* Token metadata retrieval

**3. External Services**

* Redis for session management and queues
* MongoDB for persistent storage
* BullMQ for asynchronous tasks

#### Transaction Flow

1.  **User Initiates Trade**

    ```
    User -> Bot -> Trade Feature -> Execute Service
    ```
2.  **Transaction Processing**

    ```
    Execute Service -> Jupiter -> Blockchain -> Confirmation
    ```
3.  **Fee Distribution**

    ```
    Transaction -> Fee Calculation -> Distribution
       ├─> Prize Pool
       ├─> Referral Commissions
       └─> Platform Revenue
    ```

#### System Requirements

**Technical Requirements**

* Node.js ≥ 20.18.3
* Redis Server
* MongoDB Database
* Solana RPC Node access

**Environment Variables**

```env
BOT_TOKEN=telegram_bot_token
MONGO_URI=mongodb://connection_string
REDIS_SERVER_URL=redis://localhost:6379
QUICKNODE_API_KEY=your_api_key
PLATFORM_FEE_PERCENTAGE=1
ENCRYPTION_KEY=your_encryption_key
```

**Performance Considerations**

* Optimized MongoDB indexes for transaction queries
* Redis caching for frequent data access
* BullMQ for handling high-volume tasks
* Retry mechanisms for failed transactions

#### Security Measures

1. **Transaction Security**
   * Slippage protection
   * Balance validation
   * Gas fee estimation
   * Transaction signing verification
2. **Data Security**
   * Encrypted wallet storage
   * Session-based authentication
   * Rate limiting on API endpoints
3. **Error Handling**
   * Transaction validation
   * Balance checks
   * Network error recovery
   * Queue monitoring
