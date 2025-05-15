# Deployment Guide

## Prerequisites
- Node.js LTS version
- Docker and Docker Compose
- MongoDB instance
- Redis server
- Solana wallet with sufficient SOL for transactions

## Environment Setup

1. Clone the repository:
```bash
git clone <repository-url>
cd strike-bot
```

2. Create environment files:
- `.env.bot.dev` for development
- `.env.bot.prod` for production

Required environment variables:
```bash
# Bot Configuration
BOT_TOKEN="YOUR_BOT_TOKEN"
BOT_USERNAME="YOUR_BOT_USERNAME"

# Solana Configuration
RPC_URL="https://api.mainnet-beta.solana.com"
PLATFORM_FEE_WALLET_ADDRESS="YOUR_WALLET_ADDRESS"
PLATFORM_FEE_PERCENTAGE="2.5"

# Database Configuration
MONGO_URI="YOUR_MONGODB_URI"

# Redis Configuration
REDIS_SERVER_URL="redis://redis:6379/0"

# Security Keys
IV_KEY="YOUR_IV_KEY"
ENCRYPTION_KEY="YOUR_ENCRYPTION_KEY"

# API Keys
QUICKNODE_API_KEY="YOUR_QUICKNODE_API_KEY"
QUIKNODE_RPC_URL="YOUR_QUICKNODE_RPC_URL"
BIRDEYE_API_KEY="YOUR_BIRDEYE_API_KEY"
```

## Docker Deployment

### Development Environment

1. Start services:
```bash
pnpm docker:dev
```

2. View logs:
```bash
pnpm docker:logs
```

3. Stop services:
```bash
pnpm docker:dev:down
```

### Production Environment

1. Start services:
```bash
pnpm docker:prod
```

2. View logs:
```bash
pnpm docker:logs:prod
```

3. Stop services:
```bash
pnpm docker:prod:down
```

### Docker Compose Configuration

The project uses multiple Docker Compose files:
- `compose.yml`: Base configuration
- `compose.override.yml`: Development overrides
- `compose.prod.yml`: Production settings

#### Services
1. Bot Service
   - Dockerfile: `Dockerfile.bot`
   - Purpose: Telegram bot functionality
   - Port: 3000 (dev only)

2. Server Service
   - Dockerfile: `Dockerfile.server`
   - Purpose: Admin API endpoints
   - Port: 3000

3. Redis Service
   - Image: redis:alpine
   - Purpose: Caching and queues
   - Port: 6379 (dev only)

## PM2 Deployment

For non-containerized deployment:

1. Install dependencies:
```bash
pnpm install
```

2. Build:
```bash
pnpm build
```

3. Start with PM2:
```bash
pnpm pm2:server:start
```

4. Monitor processes:
```bash
pm2 monit
```

## Scaling Considerations

### Horizontal Scaling
- Multiple bot instances with shared Redis/MongoDB
- Load balancing for admin API
- Sticky sessions for WebSocket connections

### Vertical Scaling
- Increase resources for MongoDB and Redis
- Optimize worker concurrency settings
- Tune BullMQ settings for higher throughput

### Monitoring
- Server metrics via PM2
- Container stats via Docker
- Application logs
- Error tracking
- Performance monitoring

## Backup and Recovery

### Database Backups
1. MongoDB backups:
```bash
mongodump --uri="YOUR_MONGODB_URI" --out=/backup/mongodb
```

2. Redis backups:
- Automatic backups enabled in production
- AOF persistence enabled
- Regular RDB snapshots

### Disaster Recovery
1. Keep encrypted backups
2. Document recovery procedures
3. Regular restore testing
4. Maintain backup rotation
