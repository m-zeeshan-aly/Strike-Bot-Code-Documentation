# Monitoring

### Logging Configuration

#### Server Logging Setup

The project uses Pino for server-side logging with the following configuration:

```typescript
// Logger Configuration
{
  level: config.logLevel,
  transport: {
    targets: [
      // Development Configuration
      {
        target: 'pino-pretty',
        options: {
          ignore: 'pid,hostname',
          colorize: true,
          translateTime: true
        }
      },
      // Production Configuration
      {
        target: 'pino/file',
        options: {}
      }
    ]
  }
}
```

#### Bot Update Logging

The bot implements middleware-based logging using update-logger.ts:

1. API Call Logging
   * Logs all Bot API method calls
   * Includes method name and payload
   * Debug level logging
2. Update Processing
   * Logs incoming updates
   * Performance tracking
   * Processing time measurement

Example log entries:

```json
{
  "msg": "Bot API call",
  "method": "sendMessage",
  "payload": { ... }
}

{
  "msg": "Update processed",
  "elapsed": 123.45
}
```

### Docker Logging Configuration

#### Container Log Settings

From compose.prod.yml:

```yaml
logging:
  driver: json-file
  options:
    max-size: 50m
    max-file: '3'
```

#### Log Management Features

1. Format
   * JSON structured logging
   * Timestamp inclusion
   * Service identification
2. Rotation Policy
   * Maximum file size: 50MB
   * Keeps last 3 files
   * Automatic rotation
3. Access Commands

```bash
# View real-time logs
docker logs -f strike-bot

# View last N lines
docker logs --tail=100 strike-bot

# View logs with timestamps
docker logs -t strike-bot
```

### Redis Monitoring

#### Memory Tracking

1. Real-time Memory Stats

```bash
# View memory usage
redis-cli info memory

# Monitor memory metrics
redis-cli monitor
```

2. Key Metrics

* Used Memory: `used_memory_human`
* Peak Memory: `used_memory_peak_human`
* Fragmentation Ratio: `mem_fragmentation_ratio`

#### Connection Monitoring

1. Client Connections

```bash
# List connected clients
redis-cli client list

# Get total connections
redis-cli info clients
```

2. Connection Metrics

* Connected clients count
* Blocked clients
* Tracking clients

#### Redis Performance

1. Memory Policy
   * Max Memory: 1536MB
   * Policy: allkeys-lru
   * Persistence: appendonly enabled
2. Monitoring Commands

```bash
# Monitor hit/miss ratio
redis-cli info stats | grep miss_ratio

# Check memory usage
redis-cli info memory | grep used_memory_human
```

### PM2 Process Monitoring

#### Process Management

1. Basic Monitoring

```bash
# List processes
pm2 list

# Process details
pm2 show strike-bot-server-api
```

2. Resource Monitoring

```bash
# Real-time dashboard
pm2 monit

# Quick status
pm2 status
```

#### Resource Usage Tracking

1. Memory Monitoring

* Heap Usage
* External Memory
* Total Memory

2. CPU Metrics

* CPU Usage Percentage
* Number of Restarts
* Uptime

3. Performance Metrics

```bash
# View metrics
pm2 show strike-bot-server-api

# Monitor logs
pm2 logs strike-bot-server-api
```

### Integrated Monitoring Tools

#### Combined Monitoring Dashboard

1. Resource Overview
   * Container Stats
   * Redis Memory
   * PM2 Process Status
2. Command Suite

```bash
# Container resources
docker stats strike-bot strike-bot-redis

# Redis stats
redis-cli info | grep -E "used_memory_human|connected_clients"

# PM2 overview
pm2 list
```

#### Alert Configuration

1. Resource Thresholds
   * Memory Usage > 80%
   * CPU Usage > 90%
   * Error Rate Spikes
2. Log-based Alerts
   * Error Pattern Detection
   * Response Time Monitoring
   * Connection Issues

### Best Practices

#### Log Management

1. Retention Policy
   * Production logs: 3 days
   * Error logs: 7 days
   * Audit logs: 30 days
2. Log Levels
   * ERROR: System errors
   * WARN: Potential issues
   * INFO: General information
   * DEBUG: Detailed debugging

#### Monitoring Strategy

1. Regular Checks
   * Hourly resource monitoring
   * Daily log analysis
   * Weekly performance review
2. Performance Metrics
   * Response times
   * Error rates
   * Resource utilization

#### Troubleshooting Guide

1. High Memory Usage

```bash
# Check container memory
docker stats strike-bot

# Redis memory analysis
redis-cli memory doctor
```

2. Performance Issues

```bash
# View PM2 metrics
pm2 show strike-bot-server-api

# Container performance
docker stats --no-stream
```

3. Connection Problems

```bash
# Redis connectivity
redis-cli ping

# Network status
docker network inspect bot-network
```

### Maintenance Procedures

#### Regular Maintenance

1. Log Rotation
   * Verify rotation settings
   * Clean old log files
   * Check disk usage
2. Performance Optimization
   * Redis memory cleanup
   * Container resource adjustment
   * PM2 process optimization

#### Emergency Procedures

1. High Load Response
   * Identify resource bottlenecks
   * Scale critical services
   * Implement temporary limits
2. Error Handling
   * Log analysis
   * Service restart if needed
   * Alert relevant teams
