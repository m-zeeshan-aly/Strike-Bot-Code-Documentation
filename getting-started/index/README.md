# Configuration

## Strike Bot Configuration Guide

### Table of Contents

* Overview
* Configuration Architecture
* Configuration Sources
* Loading Hierarchy
* Configurable Components
* Detailed Configuration

### Overview

Strike Bot uses a multi-layered configuration system that combines environment variables, database settings, and runtime configurations. The system is designed to be flexible, secure, and easily maintainable across different deployment environments.

### Configuration Architecture

The configuration system is structured in layers:

1. **Environment Configuration**
   * Core system settings
   * Security credentials
   * Connection strings
   * API endpoints
2. **Database Configuration**
   * MongoDB connection settings
   * Indexes and schemas
   * Performance optimizations
3. **Redis Configuration**
   * Queue management
   * Session storage
   * Caching settings
4. **Bot Settings**
   * User preferences
   * Trading parameters
   * Security settings
   * UI customization
5. **Queue Configuration**
   * Job processing
   * Transaction confirmation
   * Price monitoring

### Configuration Sources

#### 1. Environment Variables

Primary configuration source (`environment.config.ts`):

```typescript
const config = cleanEnv(process.env, {
  IV_KEY: str(),
  MONGO_URI: str(),
  BOT_TOKEN: str(),
  BOT_USERNAME: str(),
  PLATFORM_FEE_PERCENTAGE: str(),
  ENCRYPTION_KEY: str(),
  QUICKNODE_API_KEY: str(),
  PLATFORM_FEE_WALLET_ADDRESS: str(),
  REDIS_SERVER_URL: url({ default: 'redis://localhost:6379' }),
  QUIKNODE_RPC_URL: url({ default: 'https://rpc.quicknode.com' }),
  RPC_URL: url({ default: 'https://api.mainnet-beta.solana.com' }),
})
```

#### 2. Database Settings

User and system settings stored in MongoDB collections:

* Settings Schema
* Transaction Settings
* Trading Parameters
* Security Configurations

#### 3. Runtime Settings

Configurable during bot operation:

```typescript
interface ISettings {
  // Transaction settings
  transactionSpeed: 'normal' | 'fast' | 'turbo' | 'custom'
  customFeeOverride?: number
  
  // Protection features
  mevProtectBuy: boolean
  mevProtectSell: boolean
  sellProtection: boolean
  
  // Trading parameters
  buySlippage: number
  sellSlippage: number
  
  // Automation settings
  autoBuy: boolean
  autoSell: boolean
}
```

### Loading Hierarchy

The configuration loading follows this order:

1. **Bootstrap Phase**
   * Load environment variables
   * Initialize database connections
   * Setup Redis connection
2. **System Initialization**
   * Load system constants
   * Initialize queue configurations
   * Setup bot parameters
3. **Runtime Configuration**
   * Load user settings
   * Apply custom configurations
   * Initialize feature flags

### Configurable Components

#### 1. Transaction Settings

* Transaction speed modes
* Custom fee overrides
* Slippage tolerance
* MEV protection

#### 2. Trading Parameters

* Buy/Sell amounts
* Auto-trading settings
* Price monitoring
* Order limits

#### 3. Security Settings

* Trade confirmations
* Wallet protection
* Authentication settings
* API access controls

#### 4. Notification Settings

* Trade notifications
* Price alerts
* Limit order updates
* System notifications

#### 5. Performance Settings

* Database optimizations
* Queue processing
* Cache configurations
* API rate limits

### Detailed Configuration

For detailed configuration of specific components, refer to:

* Environment Variables
* Bot Configuration
* Database Configuration
* Redis Configuration
* Queue Configuration

### Default Values

The system includes sensible defaults for most settings:

```typescript
export const DEFAULT_SETTINGS = {
  // Transaction settings
  transactionSpeed: 'fast',
  
  // Protection settings
  confirmTrades: false,
  mevProtectBuy: false,
  mevProtectSell: false,
  sellProtection: false,
  
  // Trading defaults
  buyAmounts: [0.5, 1, 3, 5, 10],
  buySlippage: 15,
  sellAmounts: [50, 100],
  sellSlippage: 15,
  
  // Features
  boltEnabled: true,
  
  // Language
  language: 'en',
  
  // UI preferences
  chartPreviews: false,
  pnlShowValues: true,
  pnlShowNegative: true
}
```

### Configuration Best Practices

1. **Environment Variables**
   * Use `.env` files for local development
   * Use secure secrets management in production
   * Never commit sensitive credentials
2. **Database Settings**
   * Regular backup of configuration collections
   * Index optimization for frequently accessed settings
   * Proper validation rules
3. **Runtime Configuration**
   * Cache frequently accessed settings
   * Implement rate limits for settings changes
   * Validate all user inputs
4. **Security**
   * Encrypt sensitive configuration values
   * Implement role-based access control
   * Regular security audits

