# Docker Deployment

## Docker Deployment Guide

### Overview

The Strike Bot uses a sophisticated multi-stage Docker build process with separate configurations for development and production environments. This guide details the complete Docker setup and deployment process.

### Dockerfile Structure

#### Base Image Configuration

```dockerfile
FROM node:lts-slim AS base
```

The bot uses Node.js LTS slim image as the base, with the following core setup:

* Python3 and build essentials for native dependencies
* PNPM package manager (latest version)
* Custom non-root user `botuser` for security

#### Multi-Stage Build Process

1. **Base Stage**
   * Core system dependencies
   * PNPM setup
   * Security configurations
2. **Builder Stage**
   * Dependency installation
   * Type checking
   * Source code preparation
3. **Production Stage**
   * Full build process
   * Production dependency optimization
   * Redis environment configuration
   * Production-ready startup
4. **Development Stage**
   * Development dependencies
   * Hot-reload support
   * Volume mounts for live development

### Docker Compose Configuration

#### Base Configuration (compose.yml)

```
services:
  bot:
    build:
      context: .
    networks:
      - bot-network
    volumes:
      - dist-volume:/usr/src/dist

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
  dist-volume:
```

#### Development Overrides (compose.override.yml) 

```
services:
  bot:
    build:
      target: development
    ports:
      - '3000:80'
    volumes:
      - '.:/usr/src'
      - /usr/src/node_modules
      - /usr/src/dist
    environment:
      - REDIS_SERVER_URL=redis://redis:6379/0

  redis:
    ports:
      - '6379:6379'
```

#### Production Settings (compose.prod.yml)

```
services:
  bot:
    build:
      target: production
    container_name: strike-bot
    restart: always
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
    deploy:
      resources:
        limits:
          memory: 2G
    command: redis-server --appendonly yes --maxmemory 1536mb --maxmemory-policy allkeys-lru
```

### Deployment Commands

#### Development Deployment

```
docker compose -f compose.yml -f compose.override.yml up --build
```

#### Production Deployment

```
docker compose -f compose.yml -f compose.prod.yml up --build -d
```

### Redis Configuration

#### Production Settings

* Memory Limit: 2GB
* Maxmemory: 1536MB
* Memory Policy: allkeys-lru
* Persistence: Enabled with appendonly
* Container Name: strike-bot-redis
* Auto-restart: Enabled

#### Development Settings

* Default memory settings
* Exposed port: 6379
* Network: bot-network (isolated bridge network)

### Environment Configuration

#### Required Environment Variables

Create `.env.bot.prod` for production with:

```
// Some code# Bot Configuration
BOT_TOKEN=your_bot_token
NODE_ENV=production

# Redis Configuration
REDIS_SERVER_URL=redis://redis:6379/0

# Additional configurations as needed
```

I'll help create the Docker deployment documentation by analyzing the actual files in the project. Let me gather all the necessary information.Let me gather more configuration information to create a complete Docker deployment documentation.Based on the files I've analyzed, I'll create the Docker deployment documentation (docker.md). Here's the accurate markdown content that reflects the actual implementation:

````markdown
# Docker Deployment Guide

## Overview

The Strike Bot uses a sophisticated multi-stage Docker build process with separate configurations for development and production environments. This guide details the complete Docker setup and deployment process.

## Dockerfile Structure

### Base Image Configuration
```dockerfile
FROM node:lts-slim AS base
````

The bot uses Node.js LTS slim image as the base, with the following core setup:

* Python3 and build essentials for native dependencies
* PNPM package manager (latest version)
* Custom non-root user `botuser` for security

#### Multi-Stage Build Process

1. **Base Stage**
   * Core system dependencies
   * PNPM setup
   * Security configurations
2. **Builder Stage**
   * Dependency installation
   * Type checking
   * Source code preparation
3. **Production Stage**
   * Full build process
   * Production dependency optimization
   * Redis environment configuration
   * Production-ready startup
4. **Development Stage**
   * Development dependencies
   * Hot-reload support
   * Volume mounts for live development

### Docker Compose Configuration

#### Base Configuration (compose.yml)

```yaml
services:
  bot:
    build:
      context: .
    networks:
      - bot-network
    volumes:
      - dist-volume:/usr/src/dist

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
  dist-volume:
```

#### Development Overrides (compose.override.yml)

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
      - /usr/src/dist
    environment:
      - REDIS_SERVER_URL=redis://redis:6379/0

  redis:
    ports:
      - '6379:6379'
```

#### Production Settings (compose.prod.yml)

```yaml
services:
  bot:
    build:
      target: production
    container_name: strike-bot
    restart: always
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
    deploy:
      resources:
        limits:
          memory: 2G
    command: redis-server --appendonly yes --maxmemory 1536mb --maxmemory-policy allkeys-lru
```

### Deployment Commands

#### Development Deployment

```bash
docker compose -f compose.yml -f compose.override.yml up --build
```

#### Production Deployment

```bash
docker compose -f compose.yml -f compose.prod.yml up --build -d
```

### Redis Configuration

#### Production Settings

* Memory Limit: 2GB
* Maxmemory: 1536MB
* Memory Policy: allkeys-lru
* Persistence: Enabled with appendonly
* Container Name: strike-bot-redis
* Auto-restart: Enabled

#### Development Settings

* Default memory settings
* Exposed port: 6379
* Network: bot-network (isolated bridge network)

### Environment Configuration

#### Required Environment Variables

Create `.env.bot.prod` for production with:

```env
# Bot Configuration
BOT_TOKEN=your_bot_token
NODE_ENV=production

# Redis Configuration
REDIS_SERVER_URL=redis://redis:6379/0

# Additional configurations as needed
```

### Deployment Steps

1.  **Prepare Environment**

    ```bash
    # Clone repository and navigate to project directory
    cd strike-bot
    # Create production environment file
    cp .env.bot.example .env.bot.prod
    # Configure environment variables
    nano .env.bot.prod
    ```
2.  **Production Deployment**

    ```bash
    # Build and start services in detached mode
    docker compose -f compose.yml -f compose.prod.yml up --build -d
    ```
3.  **Verify Deployment**

    ```bash
    # Check container status
    docker ps
    # View logs
    docker logs strike-bot
    ```

### Monitoring and Maintenance

#### Log Management

* JSON file driver
* Maximum file size: 50MB
* Rotation: 3 files

#### Resource Limits

* Bot Service: 1GB memory
* Redis Service: 2GB memory (1536MB maxmemory)

#### Health Checks

```bash
# Check container health
docker container ls
# Monitor resource usage
docker stats strike-bot strike-bot-redis
```

### Troubleshooting

1.  **Container Startup Issues**

    ```bash
    docker logs strike-bot
    ```
2.  **Redis Connectivity**

    ```bash
    docker exec strike-bot-redis redis-cli ping
    ```
3.  **Resource Usage**

    ```bash
    docker stats
    ```

### Security Considerations

1. Non-root user execution
2. Limited container permissions
3. Isolated network configuration
4. Resource limitations
5. Environment variable security

### Development Workflow

1.  Start development environment:

    ```bash
    docker compose -f compose.yml -f compose.override.yml up --build
    ```
2. Live reload enabled for:
   * Source code changes
   * Configuration updates
   * Development dependencies
3. Access development services:
   * Bot API: localhost:3000
   * Redis: localhost:6379

