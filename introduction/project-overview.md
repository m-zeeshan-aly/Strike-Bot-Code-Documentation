# Project Overview

Strike Bot is a sophisticated Telegram trading bot designed for the Solana blockchain ecosystem. Built with TypeScript and the Grammy bot framework, it offers fast, secure, and efficient trading capabilities, complemented by features like limit orders, position management, weekly prize draws, and a referral program. This document provides a high-level overview of the project’s purpose, architecture, and technical implementation.

### Purpose and Goals

Strike Bot aims to simplify and enhance the trading experience on the Solana blockchain by providing:

* **Accessible Trading**: A user-friendly Telegram interface for executing token swaps, managing positions, and setting limit orders.
* **Engaging Incentives**: Weekly prize pools and a referral program to reward active users.
* **Robust Security**: Encrypted wallet management and transaction safety features to protect user assets.
* **Scalable Architecture**: A modular design to support future enhancements and high transaction volumes.

### Core Implementation Structure

#### Bot Architecture (`src/bot/`)

* **`context.ts`**: Defines custom context for enhanced bot functionality.
* **`i18n.ts`**: Implements internationalization for multi-language support.
* **`index.ts`**: Serves as the main entry point for bot initialization.

**Feature Modules (`src/bot/features/`)**

* `buyToken.feature.ts`: Handles token purchase operations.
* `sellToken.feature.ts`: Manages token selling processes.
* `trade.feature.ts`: Provides the core trading interface.
* `positions.feature.ts`: Tracks and manages user positions.
* `limitOrder.feature.ts`: Implements limit order functionality.

**Service Layer (`src/bot/services/`)**

* `dexScreenerPrice.service.ts`: Fetches real-time price data.
* `executeSwap.service.ts`: Executes swap transactions.
* `comission.service.ts`: Manages referral and platform fees.
* `settings.service.ts`: Stores and retrieves user preferences.

#### Conversation System (`conversations`)

Sophisticated conversation flows enhance user interaction:

* `buy-sell-settings.conversation.ts`: Guides users through trading settings.
* `customSolAmount.conversation.ts`: Manages custom SOL amount inputs.
* `slippagePercentage.conversation.ts`: Configures slippage settings.
* `withdrawCustomPercentage.conversation.ts`: Facilitates withdrawal processes.

### System Architecture

#### Middleware Pipeline (`middlewares`)

* `settings-init.middleware.ts`: Initializes user settings on startup.
* `update-logger.ts`: Logs bot activities for monitoring and debugging.

#### Service Layer Architecture

```
├── Price Service (Real-time price feeds via DexScreener)
├── Wallet Service (Secure wallet management)
├── Commission Service (Fee and referral handling)
├── Swap Service (Trade execution with Jupiter Aggregator)
└── Settings Service (User preference management)
```

#### Queue System (`queues`)

* **Price Monitoring Queue**: Tracks market prices for limit orders.
* **Order Execution Queue**: Processes trade orders asynchronously.
* **Transaction Processing Queue**: Handles transaction validation and execution.

### Technical Stack

* **Core Technologies**:
  * **Node.js/TypeScript**: Powers the bot’s logic and type safety.
  * **Grammy Bot Framework**: Facilitates Telegram bot development.
  * **MongoDB**: Stores user data and transaction history.
  * **Redis**: Manages sessions and caching.
  * **BullMQ**: Handles asynchronous task queues.
* **Blockchain Integration**:
  * **Solana Web3.js**: Interacts with the Solana blockchain.
  * **Jupiter Aggregator API**: Optimizes trading routes.
  * **DexScreener Price Feed**: Provides real-time price updates.
* **Infrastructure**:
  * **Docker**: Ensures consistent deployment environments.
  * **PM2**: Manages processes and ensures uptime.
  * **Health Monitoring**: Tracks bot performance and errors.

### Security Implementation

* **Wallet Security** (`walletService.helper.ts`):
  * Encrypted private key storage.
  * Secure transaction signing.
  * Rate limiting to prevent abuse.
* **Transaction Safety**:
  * Slippage protection for stable trades.
  * Transaction validation for integrity.
  * Robust error handling for reliability.

### Key Features

* **Trading**: Fast token swaps, market/limit orders, and position management.
* **Advanced Orders**: Limit order creation, price monitoring, and auto-execution.
* **User Management**: Secure wallets, persistent settings, and transaction history.
* **Rewards**: Weekly prize pools (1 entry per $100 traded) and a referral program (50% direct, 10% indirect commissions).
* **Commands**: `/start`, `/settings`, `/help`, `/withdraw`, `/buy`, `/sell`, `/limitorders`, `/positions`.

### Configuration Management

#### Environment Configuration (`src/environment.config.ts`)

```typescript
export interface EnvironmentConfig {
  NODE_ENV: string;
  BOT_TOKEN: string;
  MONGODB_URI: string;
  REDIS_URL: string;
  // Additional API keys and settings
}
```

#### Deployment Configuration (`ecosystem.config.js`)

```javascript
module.exports = {
  apps: [{
    name: "strike-bot",
    script: "dist/index.js",
    // Process management settings
  }]
}
```

### Development Tools

*   **Build System** (`package.json`):

    ```json
    {
      "scripts": {
        "build": "tsc -p tsconfig.build.json",
        "start": "node dist/index.js",
        "dev": "ts-node src/index.ts"
      }
    }
    ```
* **Code Quality**:
  * TypeScript for type safety.
  * ESLint for consistent code style.
  * Docker for containerized development and deployment.

### Integration Points

* **External APIs**:
  * Solana RPC nodes for blockchain interactions.
  * Jupiter Aggregator for optimized trading.
  * DexScreener for real-time price feeds.
* **Database Systems**:
  * MongoDB for persistent storage.
  * Redis for caching and session management.
