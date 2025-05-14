# Docker Deployment

#### Docker Deployment

The project includes a complete Docker-based deployment setup with separate configurations for development and production environments.

### Docker Configuration Files

The project uses multiple Docker configuration files:

1. `Dockerfile.bot`: Bot service container
2. `Dockerfile.server`: Admin API server container
3. `compose.yml`: Base Docker Compose configuration
4. `compose.override.yml`: Development environment overrides
5. `compose.prod.yml`: Production environment settings

#### Base Docker Configuration (compose.yml)

```yaml
services:
  bot:
    build:
      context: .
      dockerfile: Dockerfile.bot
    networks:
      - bot-network
    depends_on:
      - redis

  server:
    build:
      context: .
      dockerfile: Dockerfile.server
    networks:
      - bot-network
    depends_on:
      - redis
      - bot

  redis:
    image: redis:alpine
    volumes:
      - redis-data:/data
    networks:
      - bot-network

networks:
  bot-network:
    driver: bridge

volumes:
  redis-data:
```

#### Development Configuration (compose.override.yml)

```yaml
services:
  bot:
    build:
      target: development
    ports:
      - '3000:80'
    volumes:
      - '.:/usr/src'
      - /usr/src/node_modules
    env_file:
      - .env.bot.dev
    environment:
      - REDIS_SERVER_URL=redis://redis:6379/0
    command: [pnpm, run, dev]

  server:
    build:
      target: development
    ports:
      - '3000:3000'
    volumes:
      - '.:/usr/src'
      - /usr/src/node_modules
    env_file:
      - .env.bot.dev
    environment:
      - REDIS_SERVER_URL=redis://redis:6379/0
    command: [pnpm, run, 'start:server:dev']

  redis:
    ports:
      - '6379:6379'
```

#### Production Configuration (compose.prod.yml)

```yaml
services:
  bot:
    build:
      target: production
    container_name: strike-bot
    restart: always
    env_file:
      - .env.bot.prod
    environment:
      - REDIS_SERVER_URL=redis://redis:6379/0
    deploy:
      resources:
        limits:
          memory: 1G
    logging:
      driver: json-file
      options:
        max-size: 50m
        max-file: '3'

  server:
    build:
      target: production
    container_name: strike-bot-server
    restart: always
    ports:
      - '3000:3000'
    env_file:
      - .env.bot.prod
    environment:
      - REDIS_SERVER_URL=redis://redis:6379/0
    deploy:
      resources:
        limits:
          memory: 1G
    logging:
      driver: json-file
      options:
        max-size: 50m
        max-file: '3'

  redis:
    container_name: strike-bot-redis
    restart: always
    volumes:
      - redis-data:/data
    deploy:
      resources:
        limits:
          memory: 2G
    command: redis-server --appendonly yes --maxmemory 1536mb --maxmemory-policy allkeys-lru
```

### Environment Configuration

The system requires environment variables to be configured. Create either `.env.bot.dev` or `.env.bot.prod` depending on the environment:

```bash
# Bot Configuration
BOT_TOKEN="YOUR_BOT_TOKEN_HERE"
BOT_USERNAME="YOUR_BOT_USERNAME"

# Solana Configuration
RPC_URL="https://api.mainnet-beta.solana.com"
PLATFORM_FEE_WALLET_ADDRESS="YOUR_WALLET_ADDRESS"
PLATFORM_FEE_PERCENTAGE="2.5"

# Database Configuration
MONGO_URI="mongodb://localhost:27017/strike-bot"

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

### Available Docker Commands

The project includes various npm scripts for Docker operations:

```bash
# Development Environment
pnpm run docker:dev          # Start development environment
pnpm run docker:dev:down     # Stop development environment
pnpm run docker:logs         # View development logs

# Production Environment
pnpm run docker:prod         # Start production environment
pnpm run docker:prod:down    # Stop production environment
pnpm run docker:logs:prod    # View production logs

# Maintenance
pnpm run docker:rebuild      # Rebuild development containers
pnpm run docker:rebuild:prod # Rebuild production containers
pnpm run docker:prune       # Clean up Docker system
```

These commands are implemented in `docker-setup.sh` script which provides a consistent interface for Docker operations.

### Docker Setup Script

The `docker-setup.sh` script provides the following commands:

```bash
# Usage
./docker-setup.sh [env] [command]

# Environments:
dev        # Development environment (default)
prod       # Production environment

# Commands:
start/up   # Start services
stop/down  # Stop services
restart    # Restart services
logs       # Show logs
clean      # Remove all containers, images, and volumes
rebuild    # Rebuild services without using cache
```
