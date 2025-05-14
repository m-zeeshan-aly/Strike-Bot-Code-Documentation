# Technical Stack

Strike Bot is a sophisticated Telegram trading bot for the Solana blockchain, built with TypeScript and the Grammy bot framework. This document provides a comprehensive overview of the project's technical stack, detailing its implementation, architecture, and key components.

### Table of Contents

* Core Technologies
* Core Implementation Structure
* System Architecture
* Database and Storage
* External Integrations
* Development Tools
* Security Implementation
* Configuration Management

### Core Technologies

* **Programming Language**: TypeScript
  * Provides type safety and modern JavaScript features for robust development.
* **Bot Framework**: Grammy
  * A powerful framework for building Telegram bots with a clean and intuitive API.

### Core Implementation Structure

#### Bot Architecture (`src/bot/`)

* `context.ts`: Custom context implementation for enhanced bot functionality.
* `i18n.ts`: Internationalization setup for multi-language support.
* `index.ts`: Main bot initialization and entry point.

**Feature Modules (`src/bot/features/`)**

* `buyToken.feature.ts`: Implements token purchase functionality.
* `sellToken.feature.ts`: Handles token selling operations.
* `trade.feature.ts`: Provides the core trading interface.
* `positions.feature.ts`: Manages user positions and portfolio.
* `limitOrder.feature.ts`: Implements the limit order system.

**Service Layer (`src/bot/services/`)**

* `dexScreenerPrice.service.ts`: Integrates real-time price feeds.
* `executeSwap.service.ts`: Executes swap transactions.
* `comission.service.ts`: Manages commission and fee handling.
* `settings.service.ts`: Handles user settings and preferences.

#### Conversation System (`conversations`)

The bot features sophisticated conversation flows for seamless user interaction:

* `buy-sell-settings.conversation.ts`
* `customSolAmount.conversation.ts`
* `slippagePercentage.conversation.ts`
* `withdrawCustomPercentage.conversation.ts`

#### Core Features

**Trading System**

The `TradeFeature` class manages:

* Core trading functionality
* Market order execution
* Price monitoring
* Transaction validation

**Limit Order System**

The `LimitOrderFeature` class handles:

* Limit order creation
* Price monitoring
* Order execution
* Order cancellation

**Position Management**

The `PositionsFeature` class oversees:

* Position tracking
* PnL (Profit and Loss) calculation
* Position closing
* Portfolio management

### System Architecture

#### Middleware Pipeline (`middlewares`)

* `settings-init.middleware.ts`: Initializes user settings on startup.
* `update-logger.ts`: Logs bot activities and updates.

#### Service Layer Architecture

```
├── Price Service (Real-time price feeds)
├── Wallet Service (Wallet management)
├── Commission Service (Fee handling)
├── Swap Service (Trade execution)
└── Settings Service (User preferences)
```

#### Queue System (`queues`)

* Price monitoring queue
* Order execution queue
* Transaction processing queue

### Database and Storage

* **Persistent Storage**: MongoDB
  * Used for storing user data and transaction history.
* **Session Management**: Redis
  * Handles session data for fast access and scalability.
* **Queue System**: Dedicated system for order processing
  * Ensures efficient handling of trading operations.

### External Integrations

* **External APIs**:
  * **Solana RPC Nodes**: Blockchain interaction and data retrieval.
  * **Jupiter Aggregator**: Optimized trading routes and liquidity.
  * **DexScreener Price Feed**: Real-time price data integration.

### Development Tools

#### Build System

Defined in `package.json`:

```json
{
  "scripts": {
    "build": "tsc -p tsconfig.build.json",
    "start": "node dist/index.js",
    "dev": "ts-node src/index.ts"
  }
}
```

* `build`: Compiles TypeScript to JavaScript.
* `start`: Runs the compiled bot.
* `dev`: Development mode with live reloading.

#### Code Quality

* **TypeScript**: Ensures type safety across the codebase.
* **ESLint**: Maintains code quality and consistency.
* **Docker**: Provides containerization for deployment and testing.

### Security Implementation

#### Wallet Security

Implemented in `src/bot/helpers/walletService.helper.ts`:

* Encrypted private key storage
* Secure transaction signing
* Rate limiting to prevent abuse

#### Transaction Safety

Implemented across services:

* Slippage protection for stable trading
* Transaction validation for integrity
* Error handling for reliability

### Configuration Management

#### Environment Configuration

Defined in `src/environment.config.ts`:

```typescript
export interface EnvironmentConfig {
  NODE_ENV: string;
  BOT_TOKEN: string;
  MONGODB_URI: string;
  REDIS_URL: string;
}
```

* Supports production and development environments with API keys and network settings.

#### Deployment Configuration

Defined in `ecosystem.config.js`:

```javascript
module.exports = {
  apps: [{
    name: "strike-bot",
    script: "dist/index.js"
  }]
}
```

* Configures the bot for deployment with process management.
