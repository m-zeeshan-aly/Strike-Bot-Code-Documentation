# Production Setup

````markdown
# Production Setup Guide

## Overview

This guide details the production deployment setup for the Strike Bot on AWS EC2, including environment configuration, security considerations, and monitoring setup.

## Production Environment Setup

### Environment Variables
The production environment is configured through `.env.bot.prod` with the following structure:

```env
# Bot Configuration
BOT_TOKEN=<your-bot-token>

# Solana Configuration
RPC_URL="https://api.mainnet-beta.solana.com"
PLATFORM_FEE_WALLET_ADDRESS="<wallet-address>"

# Database Configuration
MONGO_URI="postgresql://postgres:postgres@postgres:5432/telegram_bot"

# Redis Configuration
REDIS_SERVER_URL='redis://redis:6379/0'

# Security Keys
ENCRYPTION_KEY="<your-encryption-key>"
IV_KEY="<your-iv-key>"

# API Keys
BIRDEYE_API_KEY="<your-birdeye-api-key>"
QUIKNODE_RPC_URL="<your-quicknode-url>"

````

#### Database Configuration

* PostgreSQL database running in Docker
* Connection string format: `postgresql://postgres:postgres@postgres:5432/telegram_bot`
* Persistent volume for data storage
* Automated backup configuration recommended

#### Redis Setup

Configuration from compose.prod.yml:

* Memory limit: 2GB
* Maxmemory: 1536MB
* Policy: allkeys-lru
* Persistence enabled with appendonly
* Container name: strike-bot-redis

### Security Considerations

#### Bot Token Management

1. Token Storage:
   * Stored in `.env.bot.prod`
   * Never committed to version control
   * Managed through CI/CD secrets
2. Access Control:
   * Limited to production environment
   * Rotated periodically
   * Monitored for unauthorized usage

#### Environment Secrets

1. GitHub Actions Secrets:
   * AWS\_EC2\_IP
   * AWS\_EC2\_SSH\_KEY
   * Other sensitive credentials
2. Encryption Keys:
   * ENCRYPTION\_KEY
   * IV\_KEY
   * Stored securely in environment variables
3. API Keys:
   * BIRDEYE\_API\_KEY
   * QUIKNODE\_RPC\_URL
   * Managed through secure environment variables

### AWS EC2 Deployment Process

#### Initial Setup

```bash
# Directory Structure
/home/ubuntu/strike-bot/
├── docker-compose files
├── .env.bot.prod
└── application files
```

#### Docker Setup

1.  Automatic Installation:

    ```bash
    # Docker Installation
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh

    # Docker Compose Installation
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    ```
2.  Docker Permissions:

    ```bash
    sudo usermod -aG docker $USER
    sudo chmod 666 /var/run/docker.sock
    ```

#### Deployment Configuration

**Base Configuration (compose.yml)**

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

**Production Settings (compose.prod.yml)**

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

#### Deployment Process

1. Code Transfer:
   * Automated via GitHub Actions
   * Files copied to `/home/ubuntu/strike-bot/`
2.  Container Management:

    ```bash
    # Stop existing containers
    docker-compose -f compose.yml -f compose.prod.yml down

    # Build and start new containers
    docker-compose -f compose.yml -f compose.prod.yml up -d --build

    # Clean up old images
    docker image prune -f
    ```

#### Resource Limits

1. Bot Service:
   * Memory: 1GB limit
   * Automatic restart enabled
   * Production-optimized build
2. Redis Service:
   * Memory: 2GB limit
   * Maxmemory: 1536MB
   * LRU eviction policy

### Monitoring and Logging Setup

#### Container Logging

Configuration from compose.prod.yml:

```yaml
logging:
  driver: json-file
  options:
    max-size: 50m
    max-file: '3'
```

#### Log Management

1. Bot Logs:
   * JSON format
   * 50MB file size limit
   * 3 file rotation
   * Accessible via `docker logs strike-bot`
2. Redis Logs:
   * Persistent storage enabled
   * Appendonly mode
   * System logs via Docker

#### Monitoring Tools

1.  Container Health:

    ```bash
    # Check container status
    docker ps

    # View container stats
    docker stats strike-bot strike-bot-redis
    ```
2. Resource Usage:
   * Memory utilization
   * CPU usage
   * Network statistics
   * Disk space monitoring

#### Maintenance Tasks

1.  Regular Cleanup:

    ```bash
    # Clean unused images
    docker image prune -f

    # Clean unused volumes
    docker volume prune -f
    ```
2. Backup Procedures:
   * Redis data persistence
   * Database backups
   * Environment configuration backups

### Troubleshooting

#### Common Issues

1. Container Start Failures:
   * Check logs: `docker logs strike-bot`
   * Verify environment variables
   * Check resource limits
2. Redis Connectivity:
   * Check network configuration
   * Verify Redis memory usage
   * Check connection strings
3. Deployment Failures:
   * Check GitHub Actions logs
   * Verify SSH access
   * Check disk space and permissions

#### Health Checks

1.  Service Health:

    ```bash
    # Check bot service
    docker inspect strike-bot

    # Check Redis service
    docker inspect strike-bot-redis
    ```
2.  Network Health:

    ```bash
    # Check network connectivity
    docker network inspect bot-network
    ```

### Best Practices

1. Security:
   * Regular security updates
   * Token rotation
   * Access control monitoring
2. Performance:
   * Regular resource monitoring
   * Log rotation management
   * Cache optimization
3. Maintenance:
   * Regular backups
   * Update management
   * Security patch application
4. Documentation:
   * Keep deployment docs updated
   * Document all configuration changes
   * Maintain incident reports

