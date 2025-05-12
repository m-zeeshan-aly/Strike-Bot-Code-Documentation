# Deployment

## Strike Bot Deployment Guide

### Overview

The Strike Bot can be deployed using two main methods:

#### 1. Docker Deployment (Recommended)

* Uses Docker Compose with multi-container setup
* Components:
  * Bot service (Node.js based)
  * Redis service (Alpine-based)
* Resource configurations:
  * Bot: 1GB memory limit
  * Redis: 2GB memory limit, 1536MB maxmemory with allkeys-lru policy

#### 2. PM2 Deployment

* Single instance deployment
* Fork mode execution
* Production environment focused
* Managed through ecosystem.config.js

### Prerequisites

* Docker Engine (for Docker deployment)
* Node.js LTS version
* pnpm package manager
* Redis (for PM2 deployment)
* Minimum 4GB RAM recommended
* Production environment variables (.env.bot.prod)

### Quick Links

* Docker Deployment Guide
* PM2 Deployment Guide
* Production Setup
* Monitoring

### Configuration Files

#### Docker Configuration

The project uses a three-tier Docker Compose configuration:

* `compose.yml` - Base configuration
  * Basic service definitions
  * Network setup (bot-network)
  * Volume configurations
* `compose.override.yml` - Development overrides
* `compose.prod.yml` - Production settings
  * Resource limits
  * Restart policies
  * Logging configuration
  * Redis persistence and memory settings

#### PM2 Configuration

Defined in `ecosystem.config.js`:

* Application name: 'strike-bot-server-api'
* Script path: 'dist/server/index.js'
* Single instance mode
* Production environment setup

### Environment Setup

The bot requires proper environment configuration through `.env.bot.prod`:

* Bot token and configuration
* Database connections
* Redis connection string (Docker: redis://redis:6379/0)
* API endpoints and keys
* Production-specific settings

### Network Architecture

* Isolated bridge network for Docker deployment
* Inter-service communication via Docker network
* Redis persistence through named volumes
* Log rotation: 50MB max size, 3 files maximum

### Monitoring Options

* Docker container logs (JSON format)
* PM2 process monitoring
* Redis memory and performance monitoring
* Application-level logging

### Next Steps

1. Choose your deployment method based on your requirements
2. Follow the specific deployment guide (Docker or PM2)
3. Set up monitoring and logging
4. Configure environment variables
5. Deploy and verify the bot functionality

For detailed instructions on each deployment method, follow the respective guides linked above.
