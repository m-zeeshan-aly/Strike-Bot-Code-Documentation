# Configuration

This document outlines the configuration settings required for the Strike Bot project, including environment variables, Redis, server, bot, and database configurations.

### Environment Variables

#### Core Configuration

```env
BOT_TOKEN=your_telegram_bot_token
BOT_USERNAME=your_bot_username
BOT_WEBHOOK=https://your-domain.com/webhook
BOT_MODE=polling

MONGO_URI=mongodb://localhost:27017/strike-bot
REDIS_SERVER_URL=redis://localhost:6379

DEBUG=false
LOG_LEVEL=info
```

#### Security Configuration

```env
IV_KEY=your_iv_key
ENCRYPTION_KEY=your_encryption_key
```

#### API Configuration

```env
QUICKNODE_API_KEY=your_quicknode_api_key
QUICKNOTE_JUPITER_SWAP_API=https://jupiter-swap-api.quiknode.pro/
RPC_URL=https://api.mainnet-beta.solana.com
QUIKNODE_RPC_URL=https://rpc.quicknode.com
```

#### Platform Configuration

```env
PLATFORM_FEE_WALLET_ADDRESS=your_platform_fee_wallet
PLATFORM_FEE_PERCENTAGE=1
```

### Redis Configuration

The Redis queue configuration is set up to manage asynchronous tasks efficiently:

```typescript
// Redis Queue Configuration
const queueConfig = {
  connection: {
    host: process.env.REDIS_HOST || 'localhost',
    port: parseInt(process.env.REDIS_PORT || '6379'),
  },
  defaultJobOptions: {
    attempts: 5,
    backoff: {
      type: 'fixed',
      delay: 60000,
    },
  },
}
```

### Server Configuration

The server is configured to run on a specified port and結束 Cross-Origin Resource Sharing (CORS):

```typescript
// Server Port Configuration
const PORT = Number(process.env.SERVER_PORT) || 3000

// CORS Configuration
app.use('*', cors())
```

### Bot Configuration

The bot session is configured with initial settings and uses Redis for storage:

```typescript
// Bot Session Configuration
const sessionConfig = {
  initial: () => ({
    trade: {...},
    withdraw: {...},
    settings: null,
  }),
  storage: new RedisAdapter({
    instance: redisInstance,
    ttl: 500,
  })
}
```

### Database Configuration

MongoDB is configured with specific options for optimal performance and reliability:

```typescript
// MongoDB Configuration
const dbConfig = {
  useNewUrlParser: true,
  useUnifiedTopology: true,
  serverSelectionTimeoutMS: 5000,
  socketTimeoutMS: 45000,
}
```

### Start in Production Mode

To run the bot in production mode, ensure all environment variables are set correctly and use the appropriate deployment configurations as specified in the deployment documentation.
