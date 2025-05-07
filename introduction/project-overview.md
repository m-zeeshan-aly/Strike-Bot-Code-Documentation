Strike Bot - Project Overview
Introduction
Strike Bot is a sophisticated Telegram trading bot implementation for the Solana blockchain, built with TypeScript and the Grammy bot framework. This document provides a comprehensive overview of the project's implementation and architecture.
Core Implementation Structure
1. Bot Architecture (src/bot/)
// Key Components:
- context.ts         // Custom context implementation
- i18n.ts           // Internationalization setup
- index.ts          // Main bot initialization

1.1 Feature Modules (src/bot/features/)
// Core Trading Features:
- buyToken.feature.ts    // Token purchase implementation
- sellToken.feature.ts   // Token selling implementation
- trade.feature.ts       // Trading interface
- positions.feature.ts   // Position management
- limitOrder.feature.ts  // Limit order system

1.2 Service Layer (src/bot/services/)
// Core Services:
- dexScreenerPrice.service.ts  // Price feed integration
- executeSwap.service.ts       // Swap execution
- comission.service.ts         // Commission handling
- settings.service.ts          // User settings management

2. Conversation System (conversations)
The bot implements sophisticated conversation flows for various trading operations:
// Key Conversations:
- buy-sell-settings.conversation.ts
- customSolAmount.conversation.ts
- slippagePercentage.conversation.ts
- withdrawCustomPercentage.conversation.ts

Technical Features
3.1 Database Integration
// Configuration in src/database.config.ts
- MongoDB for persistent storage
- Redis for session management
- Queue system for order processing

3.2 Environment Management
// Defined in src/environment.config.ts
- Production/Development environments
- API keys and secrets
- Network configurations

Core Features Implementation
1. Trading System
// Implementation in src/bot/features/trade.feature.ts
export class TradeFeature {
    // Core trading functionality
    // Market order execution
    // Price monitoring
    // Transaction validation
}

2. Limit Order System
// Implementation in src/bot/features/limitOrder.feature.ts
export class LimitOrderFeature {
    // Limit order creation
    // Price monitoring
    // Order execution
    // Order cancellation
}

3. Position Management
// Implementation in src/bot/features/positions.feature.ts
export class PositionsFeature {
    // Position tracking
    // PnL calculation
    // Position closing
    // Portfolio management
}

System Architecture
1. Middleware Pipeline (middlewares)
// Key Middleware Components:
- settings-init.middleware.ts  // User settings initialization
- update-logger.ts            // Activity logging

2. Service Layer Architecture
// Core Services Structure:
├── Price Service (Real-time price feeds)
├── Wallet Service (Wallet management)
├── Commission Service (Fee handling)
├── Swap Service (Trade execution)
└── Settings Service (User preferences)

3. Queue System (queues)
// Implemented Queues:
- Price monitoring queue
- Order execution queue
- Transaction processing queue

Security Implementation
1. Wallet Security
// Implementation in src/bot/helpers/walletService.helper.ts
- Encrypted private key storage
- Secure transaction signing
- Rate limiting

2. Transaction Safety
// Implementation across services:
- Slippage protection
- Transaction validation
- Error handling

Configuration Management
1. Environment Configuration
// From src/environment.config.ts
export interface EnvironmentConfig {
    NODE_ENV: string;
    BOT_TOKEN: string;
    MONGODB_URI: string;
    REDIS_URL: string;
    // ... other configurations
}

2. Deployment Configuration
// From ecosystem.config.js
module.exports = {
    apps: [{
        name: "strike-bot",
        script: "dist/index.js",
        // ... deployment settings
    }]
}

Integration Points
1. External APIs

Solana RPC nodes
Jupiter Aggregator
DexScreener Price Feed

2. Database Systems

MongoDB for persistent storage
Redis for caching and sessions

Development Tools
1. Build System
// From package.json
{
    "scripts": {
        "build": "tsc -p tsconfig.build.json",
        "start": "node dist/index.js",
        "dev": "ts-node src/index.ts"
    }
}

2. Code Quality

TypeScript for type safety
ESLint for code quality
Docker for containerization

