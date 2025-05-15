# Environment Variables

### Required Environment Variables

| Variable                       | Description                          | Validation                               |
| ------------------------------ | ------------------------------------ | ---------------------------------------- |
| IV\_KEY                        | Initialization vector for encryption | Required string                          |
| MONGO\_URI                     | MongoDB connection string            | Required string                          |
| BOT\_TOKEN                     | Telegram bot token                   | Required string, format: `number:string` |
| BOT\_USERNAME                  | Telegram bot username                | Required string                          |
| PLATFORM\_FEE\_PERCENTAGE      | Fee charged for transactions         | Required string                          |
| ENCRYPTION\_KEY                | Key for data encryption              | Required string                          |
| QUICKNODE\_API\_KEY            | QuickNode API access key             | Required string                          |
| PLATFORM\_FEE\_WALLET\_ADDRESS | Wallet for collecting fees           | Required string                          |

### Optional Environment Variables

| Variable           | Description            | Default Value                         |
| ------------------ | ---------------------- | ------------------------------------- |
| REDIS\_SERVER\_URL | Redis connection URL   | `redis://localhost:6379`              |
| QUIKNODE\_RPC\_URL | QuickNode RPC endpoint | `https://rpc.quicknode.com`           |
| RPC\_URL           | Solana RPC endpoint    | `https://api.mainnet-beta.solana.com` |
| BOT\_MODE          | Bot operation mode     | `polling`                             |
| DEBUG              | Enable debug mode      | `false`                               |
| LOG\_LEVEL         | Logging verbosity      | `info`                                |

### Example Configuration

```env
# Bot Configuration
BOT_TOKEN="YOUR_BOT_TOKEN_HERE"
BOT_USERNAME="YOUR_BOT_USERNAME"

# Solana Configuration
RPC_URL="https://api.mainnet-beta.solana.com"
PLATFORM_FEE_WALLET_ADDRESS="YOUR_WALLET_ADDRESS"
PLATFORM_FEE_PERCENTAGE="2.5"

# Database Configuration
MONGO_URI="mongodb://localhost:27017/strike-bot"
MONGO_DB_NAME = "StrikeBot etc"

# Redis Configuration
REDIS_SERVER_URL="redis://redis:6379/0"

# Security Keys
IV_KEY="YOUR_IV_KEY"
ENCRYPTION_KEY="YOUR_ENCRYPTION_KEY"

# API Keys
QUICKNODE_API_KEY="YOUR_QUICKNODE_API_KEY"
QUIKNODE_RPC_URL="YOUR_QUICKNODE_RPC_URL"
QUICKNOTE_JUPITER_SWAP_API="YOUR_JUPITER_SWAP_API"
```

### Validation Rules

* Bot Token: Must match pattern `^\d+:[\w-]+$`
* URLs: Must be valid URL format
* Log Level: Must be one of: `trace`, `debug`, `info`, `warn`, `error`, `fatal`, `silent`
* Bot Mode: Must be either `polling` or `webhook`

### Environment-Specific Settings

#### Development

* Uses .env file in project root
* Debug mode typically enabled
* Local Redis and MongoDB instances

#### Production

* Uses environment variables
* Debug mode disabled
* External Redis and MongoDB instances
* Secure RPC endpoints required
