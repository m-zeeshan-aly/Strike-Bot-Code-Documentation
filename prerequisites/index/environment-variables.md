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
# Required Variables
IV_KEY=your-iv-key
MONGO_URI=mongodb://username:password@host:port/database
BOT_TOKEN=1234567890:ABCdefGHIjklMNOpqrsTUVwxyz
BOT_USERNAME=YourBotUsername
PLATFORM_FEE_PERCENTAGE=1
ENCRYPTION_KEY=your-encryption-key
QUICKNODE_API_KEY=your-quicknode-key
PLATFORM_FEE_WALLET_ADDRESS=your-solana-wallet-address

# Optional Variables
REDIS_SERVER_URL=redis://localhost:6379
QUIKNODE_RPC_URL=https://your-quicknode-endpoint
RPC_URL=https://your-rpc-endpoint
BOT_MODE=polling
DEBUG=false
LOG_LEVEL=info
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
