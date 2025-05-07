# Strike Bot - Introduction

## Overview

Strike Bot is a sophisticated Telegram trading bot built for the Solana blockchain ecosystem. It provides users with fast, efficient, and secure trading capabilities along with additional features like weekly prize draws and a referral program.

## Core Features

### 1. Trading Capabilities
- Quick token swaps on Solana
- Custom slippage settings
- Real-time price monitoring
- Support for both market and limit orders
- Position management
- Multiple token pair support

### 2. Advanced Order Systems
- Limit order functionality
- Price monitoring system
- Auto-execution of orders
- Order expiry management
- Position tracking

### 3. User Management
- Secure wallet integration
- User settings persistence
- Custom trading preferences
- Balance tracking
- Transaction history

### 4. Reward Systems
- Weekly prize pool
- Referral program
  - 50% commission to direct referrer
  - 10% commission to indirect referrer
  - Prize pool entries (1 per $100 traded)

### 5. Security Features
- Encrypted private key storage
- Session management
- Rate limiting
- Error handling and recovery
- Secure withdrawal system

## Technical Stack

### Core Technologies
- Node.js/TypeScript
- Grammy Bot Framework
- MongoDB Database
- Redis Cache
- BullMQ for Queue Management

### Blockchain Integration
- Solana Web3.js
- Jupiter Aggregator API
- DexScreener Price Feed

### Infrastructure
- Docker containerization
- PM2 process management
- Graceful shutdown handling
- Health monitoring

## Bot Commands

```typescript
/start      - Initialize the bot and create wallet
/settings   - Configure bot settings
/help       - Display help information
/withdraw   - Initiate withdrawal process