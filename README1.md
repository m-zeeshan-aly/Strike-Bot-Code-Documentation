# Strike Bot: Comprehensive Technical Documentation

## Table of Contents

1. [Introduction](#introduction)
2. [System Architecture](#system-architecture)
3. [Project Setup](#project-setup)
    - [Environment Requirements](#environment-requirements)
    - [Installation and Configuration](#installation-and-configuration)
    - [Environment Variables](#environment-variables)
4. [Core Components](#core-components)
    - [Telegram Bot](#telegram-bot)
    - [Admin Dashboard API](#admin-dashboard-api)
    - [Database Structure](#database-structure)
    - [Background Workers](#background-workers)
5. [Bot Features](#bot-features)
    - [User Onboarding](#user-onboarding)
    - [Wallet Management](#wallet-management)
    - [Token Trading](#token-trading)
    - [Limit Orders](#limit-orders)
    - [Positions and Portfolio](#positions-and-portfolio)
    - [Settings and Preferences](#settings-and-preferences)
    - [Referral System](#referral-system)
6. [Admin API Endpoints](#admin-api-endpoints)
    - [Authentication](#authentication)
    - [User Management](#user-management)
    - [Transaction Management](#transaction-management)
    - [Referral Management](#referral-management)
    - [Weekly Winners](#weekly-winners)
    - [System Settings](#system-settings)
7. [Service Layer](#service-layer)
    - [Solana Integration](#solana-integration)
    - [Jupiter Swap Integration](#jupiter-swap-integration)
    - [Commission Processing](#commission-processing)
    - [Notification System](#notification-system)
    - [Token Price Tracking](#token-price-tracking)
8. [Workers and Queue System](#workers-and-queue-system)
    - [Price Monitoring](#price-monitoring)
    - [Order Execution](#order-execution)
    - [Order Expiry](#order-expiry)
    - [Transaction Confirmation](#transaction-confirmation)
9. [Deployment](#deployment)
    - [Docker Deployment](#docker-deployment)
    - [PM2 Deployment](#pm2-deployment)
    - [Scaling Considerations](#scaling-considerations)
10. [Security](#security)
    - [Wallet Encryption](#wallet-encryption)
    - [API Security](#api-security)
    - [Rate Limiting](#rate-limiting)
11. [Troubleshooting](#troubleshooting)
    - [Common Issues](#common-issues)
    - [Logging](#logging)
    - [Monitoring](#monitoring)
12. [Maintenance and Updates](#maintenance-and-updates)
    - [Database Maintenance](#database-maintenance)
    - [Bot Token Rotation](#bot-token-rotation)
    - [System Updates](#system-updates)

## Introduction

Strike Bot is a sophisticated Telegram bot for cryptocurrency trading on the Solana blockchain. It provides users with a comprehensive trading platform directly within Telegram, enabling them to buy, sell, set limit orders, and manage their crypto portfolios with minimal friction.

The system consists of two primary components:
1. A Telegram bot built on the grammY framework for user interactions
2. An admin dashboard API built with Hono for monitoring and management

This documentation covers all aspects of the Strike Bot system from setup to deployment, intended for developers who need to understand, modify, or deploy the system.

## System Architecture

Strike Bot follows a microservices architecture, with several interconnected components:

```
┌───────────────────┐     ┌───────────────────┐     ┌───────────────────┐
│                   │     │                   │     │                   │
│   Telegram Bot    │     │   Admin Server    │     │   Background      │
│   (grammY)        │     │   (Hono)          │     │   Workers         │
│                   │     │                   │     │   (BullMQ)        │
└────────┬──────────┘     └────────┬──────────┘     └────────┬──────────┘
         │                         │                         │
         │                         │                         │
         ▼                         ▼                         ▼
┌────────────────────────────────────────────────────────────────────────┐
│                                                                        │
│                            Redis                                       │
│                                                                        │
└────────────────────────────────────────────────────────────────────────┘
         ▲                         ▲                         ▲
         │                         │                         │
         │                         │                         │
┌────────┴──────────┐     ┌────────┴──────────┐     ┌────────┴──────────┐
│                   │     │                   │     │                   │
│    MongoDB        │     │    Solana         │     │    External       │
│    Database       │     │    Blockchain     │     │    APIs           │
│                   │     │                   │     │                   │
└───────────────────┘     └───────────────────┘     └───────────────────┘
```

### Key technology stack:
- **Node.js with TypeScript**: Core runtime environment
- **grammY**: Framework for building the Telegram bot
- **Hono**: High-performance web framework for the Admin API
- **MongoDB**: Primary database for storing user data, wallets, and transactions
- **Redis**: Used for session management and job queues
- **BullMQ**: Background job processing for order execution and price monitoring
- **Solana Web3.js**: Interaction with the Solana blockchain
- **Jupiter API**: DEX aggregator for optimal token swaps

This architecture enables high scalability and resilience, with separate components that can be independently scaled as needed.

## Project Setup

### Environment Requirements

Before setting up Strike Bot, ensure your system meets the following requirements:

- **Node.js**: Version 20.18.3 or higher
- **PNPM**: Version 9.10.0 or higher (package manager)
- **MongoDB**: Version 5.0 or higher
- **Redis**: Version 6.0 or higher
- **Docker & Docker Compose**: Latest version (optional, for containerized deployment)

### Installation and Configuration

To set up the project for development:

1. **Clone the repository**:
```bash
git clone <repository-url> strike-bot
cd strike-bot
```

2. **Install dependencies**:
```bash
pnpm install
```

3. **Create an environment configuration file**:
```bash
cp .env.example .env
```

4. **Fill in required environment variables** (see Environment Variables section below)

5. **Build the project**:
```bash
pnpm build
```

6. **Start development mode**:
```bash
pnpm dev
```

For production deployment, see the [Deployment](#deployment) section.

### Environment Variables

The Strike Bot requires several environment variables to function correctly. These are stored in a `.env` file in the project root. Key environment variables include:

| Variable | Description | Required |
|----------|-------------|----------|
| `BOT_TOKEN` | Telegram Bot API token | Yes |
| `BOT_USERNAME` | Telegram bot username | Yes |
| `MONGO_URI` | MongoDB connection URI | Yes |
| `MONGO_DB_NAME` | MongoDB database name | Yes |
| `REDIS_SERVER_URL` | Redis server URL | Yes |
| `ENCRYPTION_KEY` | Key for wallet encryption (Base64) | Yes |
| `IV_KEY` | Initialization vector for encryption (Base64) | Yes |
| `PLATFORM_FEE_PERCENTAGE` | Trading fee percentage | Yes |
| `PLATFORM_FEE_WALLET_ADDRESS` | Wallet address for collecting fees | Yes |
| `QUICKNODE_API_KEY` | QuickNode API key for Solana RPC | Yes |
| `RPC_URL` | Solana RPC URL | Yes |
| `QUICKNOTE_JUPITER_SWAP_API` | Jupiter Swap API URL | Yes |
| `AUTH_SECRET` | Secret for admin API authentication | Yes |

Additional optional variables can be found in the `src/environment.config.ts` file.

## Core Components

### Telegram Bot

The Telegram bot is built using the grammY framework, a modern Telegram bot framework for TypeScript. The bot is structured using a feature-based architecture, where each capability is isolated in its own module.

#### Key Files and Directories

- `src/bot/index.ts`: Entry point for the bot
- `src/bot/features/`: Contains all bot features (buy, sell, limit orders, etc.)
- `src/bot/conversations/`: Conversation handlers for complex interactions
- `src/bot/keyboards/`: UI components for Telegram inline keyboards
- `src/bot/services/`: Business logic and external service integrations
- `src/bot/middlewares/`: Request processing middleware

#### Bot Startup Process

The bot startup process in `src/bot/index.ts` consists of:

1. Connecting to MongoDB
2. Initializing Redis for session storage
3. Setting up the bot with middleware (session, hydration, etc.)
4. Registering conversations for complex interactions
5. Loading commands and features
6. Initializing the limit order system
7. Setting up error handlers and graceful shutdown
8. Starting the bot

### Admin Dashboard API

The admin dashboard API is built with Hono, a lightweight, high-performance web framework. It provides endpoints for monitoring and managing the bot.

#### Key Files and Directories

- `src/server/index.ts`: Entry point for the API server
- `src/server/apis/routes/`: API route definitions
- `src/server/apis/controllers/`: Request handlers
- `src/server/apis/services/`: Business logic for the API
- `src/server/middlewares/`: Request processing middleware

#### API Setup Process

The API setup process in `src/server/index.ts` includes:

1. Creating a Hono instance
2. Applying middleware (auth, logging, etc.)
3. Registering API routes
4. Starting the HTTP server

### Database Structure

Strike Bot uses MongoDB as its primary database, with several collections:

- **Users**: Stores user information and preferences
- **Wallets**: Encrypted wallet information for users
- **Settings**: User settings and preferences
- **LimitOrders**: Active and historical limit orders
- **Transactions**: Record of all user transactions
- **Referrals**: Referral system data
- **BlockedUsers**: Users blocked from using the system
- **WeeklyWinners**: Weekly competition winners
- **Constants**: System-wide settings

The MongoDB connection is established in `src/database.config.ts`.

### Background Workers

The system uses BullMQ with Redis for background processing tasks:

- **Price Monitoring**: Watches token prices for limit order execution
- **Order Execution**: Executes limit orders when conditions are met
- **Order Expiry**: Cleans up expired limit orders
- **Transaction Confirmation**: Verifies transaction completion

Workers are defined in the `src/bot/workers/` and `src/server/workers/` directories.

## Bot Features

### User Onboarding

When a user starts the bot for the first time, it guides them through the onboarding process:

1. **Welcome Message**: The user receives a welcome message with an overview of the bot's capabilities.
2. **Wallet Creation**: A secure Solana wallet is automatically created for the user.
3. **Feature Introduction**: The user is introduced to the main features of the bot.

The onboarding process is managed in `src/bot/features/start.feature.ts` and related keyboard builders.

### Wallet Management

The bot provides users with wallet functionality:

- **Wallet Generation**: Secure wallet creation with encrypted private keys
- **Balance Viewing**: Check token balances
- **Deposit**: Generate addresses for depositing SOL and tokens
- **Withdraw**: Transfer SOL and tokens to external wallets

Wallet functionality is primarily implemented in the wallet service (`src/bot/helpers/walletService.helper.ts`) and withdraw feature (`src/bot/features/withdraw.feature.ts`).

### Token Trading

Users can buy and sell Solana tokens through the bot:

- **Token Search**: Find tokens by address, name, or symbol
- **Buy**: Purchase tokens using SOL
- **Sell**: Sell tokens for SOL
- **Slippage Control**: Set custom slippage tolerances
- **Fee Management**: View and control transaction fees

Trading functionality is implemented in `src/bot/features/buyToken.feature.ts`, `src/bot/features/sellToken.feature.ts`, and `src/bot/features/trade.feature.ts`.

The actual swap execution occurs in `src/bot/services/jupiterSwap.service.ts`, which integrates with Jupiter, a popular Solana DEX aggregator.

### Limit Orders

The limit order system allows users to set conditional orders:

- **Buy Limits**: Buy tokens when price falls to a target
- **Sell Limits**: Sell tokens when price rises to a target
- **Expiry Settings**: Set how long orders should remain active
- **Order Management**: View, edit, and cancel limit orders

The limit order system is implemented across several files:
- `src/bot/features/limitOrder.feature.ts`: User interface
- `src/bot/services/limitOrder.service.ts`: Order management
- `src/bot/workers/priceMonitor.worker.ts`: Price monitoring
- `src/bot/workers/orderExecution.worker.ts`: Order execution

### Positions and Portfolio

Users can manage their token portfolio:

- **Token List**: View all tokens in the wallet
- **Token Details**: See detailed information about each token
- **Performance Tracking**: Monitor price changes and portfolio value
- **PNL Cards**: Generate performance cards for sharing

Portfolio functionality is implemented in `src/bot/features/positions.feature.ts` and related services.

### Settings and Preferences

The bot offers various settings and preferences:

- **Slippage Settings**: Default slippage for trades
- **Fee Settings**: Configure priority fees for transactions
- **UI Preferences**: Customize the bot interface
- **Security Settings**: Configuration for trading protections

Settings are managed in `src/bot/features/settings.feature.ts` and the settings service (`src/bot/services/settings.service.ts`).

### Referral System

The bot includes a referral system for user growth:

- **Referral Links**: Generate links to share with friends
- **Commission Tracking**: View earned commissions
- **Reward Settings**: Configure reward wallet addresses

The referral system is implemented in `src/bot/services/referrals/` directory.

## Admin API Endpoints

### Authentication

The admin API uses JWT-based authentication:

```typescript
// Middleware to authenticate API requests
export function authMiddleware(): MiddlewareHandler {
  return async (c, next) => {
    const authHeader = c.req.header('Authorization')
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return c.json({ error: 'Unauthorized - Missing or invalid token' }, 401)
    }

    const token = authHeader.substring(7)
    try {
      // Verify token
      await next()
    }
    catch (error) {
      return c.json({ error: 'Unauthorized - Invalid token' }, 401)
    }
  }
}
```

All routes except `/health` require authentication.

### User Management

The admin API provides endpoints for user management:

- `GET /users/get-all-users`: Retrieve all users with pagination
- `GET /users/top-10-users`: Get top users by transaction volume
- `GET /users/user-details`: Get detailed information about a user
- `POST /users/block-or-unblock-user`: Block or unblock a user

User-related endpoints are defined in `src/server/apis/routes/user.routes.ts`.

### Transaction Management

Transaction management endpoints include:

- `GET /transactions/all-transactions`: Get all transactions with pagination
- `GET /transactions/last-month-transactions`: Get transactions from the last month
- `GET /transactions/transaction-count-comparison`: Compare transaction counts
- `GET /transactions/transaction-amount-comparison`: Compare transaction amounts

Transaction routes are defined in `src/server/apis/routes/transaction.routes.ts`.

### Referral Management

Referral management endpoints include:

- `GET /referrals/get-all-referrals`: Get all referrals with filters
- `PUT /referrals/update-custom-commission-rate`: Update custom commission rate

Referral routes are defined in `src/server/apis/routes/referral.routes.ts`.

### Weekly Winners

The system includes a weekly competition with winners:

- `POST /weekly-winners/create-current-week-winners`: Create winners for the current week
- `GET /weekly-winners/get-all-winners`: Get all weekly winners
- `GET /weekly-winners/get-top-users`: Get top users for the current week

These endpoints are defined in `src/server/apis/routes/weeklyWinner.routes.ts`.

### System Settings

System settings endpoints:

- `POST /constants/update-winner-percentages`: Update winner percentages
- `POST /constants/update-commission`: Update platform commission rates

Constants routes are defined in `src/server/apis/routes/constant.routes.ts`.

## Service Layer

### Solana Integration

The bot integrates with the Solana blockchain through several services:

- `walletService.helper.ts`: Wallet creation and management
- `solana.utils.ts`: Utility functions for Solana interactions
- `transaction.service.ts`: Transaction building and submission

Key functionality includes:

- SPL token operations
- Transaction building with SOL and token transfers
- Priority fee management
- Transaction signing and submission

### Jupiter Swap Integration

Token swaps are executed through Jupiter API integration:

```typescript
export class JupiterSwapService {
  private connection: Connection

  constructor(private rpcUrl: string) {
    this.connection = new Connection(rpcUrl)
  }

  // Fetches the best swap route from Jupiter API
  async getQuote(params: SwapParams): Promise<SwapQuote> {
    // Implementation details
  }

  // Executes a swap transaction
  async executeSwap(params: SwapExecutionParams): Promise<TransactionResult> {
    // Implementation details
  }
}
```

The Jupiter integration is implemented in `src/bot/services/jupiterSwap.service.ts`.

### Commission Processing

The system includes commission processing for platform fees and referrals:

- Platform fees: Percentage taken from each trade
- Referral commissions: Percentage shared with referrers

Commission processing is implemented in `src/bot/services/commission.service.ts`.

### Notification System

The notification system handles communication with users:

- Limit order notifications
- Transaction confirmations
- Weekly winner announcements

The notification service is implemented in `src/bot/services/notification.service.ts`.

### Token Price Tracking

Token prices are tracked through integration with DexScreener:

```typescript
export class DexScreenerPriceService {
  private static readonly API_BASE_URL = 'https://api.dexscreener.com/latest/dex'
  private cache: Map<string, { price: number, timestamp: number }> = new Map()
  private static readonly CACHE_EXPIRY = 30 * 1000 // 30 seconds

  // Get current token price
  async getTokenPrice(tokenAddress: string): Promise<number> {
    // Implementation with caching
  }
}
```

Price tracking is implemented in `src/bot/services/dexScreenerPrice.service.ts`.

## Workers and Queue System

### Price Monitoring

The price monitoring worker regularly checks token prices for limit orders:

```typescript
export const priceMonitorWorker = new Worker('priceMonitor', async (job: Job): Promise<PriceCheckResult> => {
  // Fetch active limit orders
  // Check current prices
  // Identify orders ready for execution
  // Add execution jobs to queue
}, {
  connection,
  concurrency: 1,
  lockDuration: 30000,
})
```

This worker is defined in `src/bot/workers/priceMonitor.worker.ts`.

### Order Execution

The order execution worker processes limit orders when price conditions are met:

```typescript
export const orderExecutionWorker = new Worker('orderExecution', async (job: Job): Promise<OrderExecutionResult> => {
  // Extract order details
  // Execute buy or sell transaction
  // Update order status
  // Send notifications
}, {
  connection,
  concurrency: 1,
  lockDuration: 60000,
})
```

This worker is defined in `src/bot/workers/orderExecution.worker.ts`.

### Order Expiry

The order expiry worker cleans up expired limit orders:

```typescript
export const orderExpiryWorker = new Worker('orderExpiry', async (job: Job): Promise<ExpiryCheckResult> => {
  // Find expired orders
  // Mark as expired
  // Send notifications
}, {
  connection,
  concurrency: 1,
  lockDuration: 15000,
})
```

This worker is defined in `src/bot/workers/orderExpiry.worker.ts`.

### Transaction Confirmation

The transaction confirmation worker verifies that transactions are confirmed on-chain:

```typescript
export const worker = new Worker('transactionConfirmation', async (job: Job) => {
  // Check transaction status
  // Update database records
  // Send confirmation notifications
}, {
  connection,
  concurrency: 1,
  limiter: {
    max: 5,
    duration: 60 * 1000,
  },
})
```

This worker is defined in `src/server/workers/transactionConfirmation.worker.ts`.

## Deployment

### Docker Deployment

The project includes Docker configuration for containerized deployment:

**Files:**
- `Dockerfile`: Multi-stage build for the application
- `Dockerfile.bot`: Specific container for the bot
- `Dockerfile.server`: Specific container for the admin API
- `compose.yml`: Base Docker Compose configuration
- `compose.override.yml`: Development overrides
- `compose.prod.yml`: Production configuration

**Development Deployment:**
```bash
pnpm docker:dev
```

**Production Deployment:**
```bash
pnpm docker:prod
```

**Stopping Containers:**
```bash
pnpm docker:dev:down  # Development
pnpm docker:prod:down # Production
```

**Viewing Logs:**
```bash
pnpm docker:logs      # Development
pnpm docker:logs:prod # Production
```

### PM2 Deployment

For non-containerized deployment, PM2 process manager is supported:

**Files:**
- `ecosystem.config.cjs`: PM2 configuration

**Starting with PM2:**
```bash
pnpm pm2:server:start
```

**Reloading after updates:**
```bash
pnpm pm2:server:reload
```

**Stopping services:**
```bash
pnpm pm2:server:stop
```

### Scaling Considerations

For scaling the application:

1. **Horizontal Scaling:**
   - Multiple bot instances with shared Redis and MongoDB
   - Load balancing for the admin API

2. **Vertical Scaling:**
   - Increase resources for MongoDB and Redis
   - Optimize worker concurrency settings

3. **Queue Optimization:**
   - Tune BullMQ settings for higher throughput
   - Increase worker concurrency for specific queues

## Security

### Wallet Encryption

The system uses AES-256-CBC encryption for wallet private keys:

```typescript
function encrypt(text: string): string {
  const cipher = crypto.createCipheriv('aes-256-cbc', ENCRYPTION_KEY, IV_KEY)
  let encrypted = cipher.update(text, 'utf8', 'hex')
  encrypted += cipher.final('hex')
  return encrypted
}

function decrypt(encryptedText: string): string {
  const decipher = crypto.createDecipheriv('aes-256-cbc', ENCRYPTION_KEY, IV_KEY)
  let decrypted = decipher.update(encryptedText, 'hex', 'utf8')
  decrypted += decipher.final('utf8')
  return decrypted
}
```

Encryption is implemented in `src/bot/helpers/walletService.helper.ts`.

### API Security

The admin API is secured through:

1. JWT authentication
2. HTTPS (when deployed)
3. Request validation
4. Error handling to prevent information leakage

### Rate Limiting

Rate limiting is implemented at multiple levels:

1. Telegram's built-in rate limiting
2. Worker concurrency and limiters
3. API middleware for request throttling

## Troubleshooting

### Common Issues

**1. Redis Connection Failures**

Check Redis connection string and ensure Redis is running:
```bash
redis-cli ping
```

**2. MongoDB Connection Issues**

Verify MongoDB connection string and database access:
```bash
mongosh "mongodb://username:password@hostname:port/database"
```

**3. Bot Token Validation Errors**

Ensure the BOT_TOKEN is correct and the bot is not blocked by Telegram.

### Logging

The system uses structured logging with different log levels:

- Error logs: `logs/error.log`
- Application logs: `logs/app.log`

Log configuration is in `src/logger.ts`.

### Monitoring

For monitoring the application:

1. **Health Check Endpoint:**
   - `GET /health`: Returns status of the system components

2. **PM2 Monitoring:**
   - `pm2 monit`: Real-time monitoring dashboard
   - `pm2 logs`: View application logs

3. **Docker Logs:**
   - `docker-compose logs -f`: Follow container logs

## Maintenance and Updates

### Database Maintenance

Regular database maintenance tasks:

1. **Index Optimization:**
   ```javascript
   db.transactions.createIndex({ date: 1 })
   db.transactions.createIndex({ telegramId: 1 })
   ```

2. **Data Archiving:**
   - Move old transactions to archive collections
   - Clean up expired limit orders

### Bot Token Rotation

To rotate the bot token:

1. Obtain a new token from BotFather
2. Update the BOT_TOKEN environment variable
3. Restart the bot service

### System Updates

For updating the system:

1. Pull latest code: `git pull`
2. Install dependencies: `pnpm install`
3. Build the project: `pnpm build`
4. Restart services:
   - Docker: `pnpm docker:rebuild:prod`
   - PM2: `pnpm pm2:server:reload`

---

This documentation covers the core aspects of the Strike Bot system. For specific implementation details, refer to the codebase and comments within the files.
