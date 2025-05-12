# Redis Configuration

## Redis Configuration Guide

### Connection Configuration

Redis is used for session management and job queues in Strike Bot. The connection is configured through the environment variable:

```env
REDIS_SERVER_URL=redis://localhost:6379
```

#### Basic Configuration

```typescript
// Redis client initialization
const redisInstance = new Redis(env.REDIS_SERVER_URL, {
  maxRetriesPerRequest: null
})
```

### Cache Settings

The bot uses Redis for:

* Session storage with TTL: 500 seconds
* Queue data persistence
* Transaction caching

```typescript
const storage = new RedisAdapter({ 
  instance: redisInstance, 
  ttl: 500 
})
```

### Environment Variables

| Variable           | Description               | Default                |
| ------------------ | ------------------------- | ---------------------- |
| REDIS\_SERVER\_URL | Redis connection URL      | redis://localhost:6379 |
| REDIS\_PASSWORD    | Redis password (optional) | -                      |
| REDIS\_DB          | Redis database number     | 0                      |

### Cluster Configuration

#### Development Environment

```yaml
services:
  redis:
    ports:
      - '6379:6379'
```

#### Production Environment

```yaml
services:
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

### Timeouts and Retry Strategy

```typescript
// Connection options
const redisOptions = {
  maxRetriesPerRequest: null,  // Unlimited retries
  connectTimeout: 10000,       // 10 seconds
  retryStrategy: (times: number) => {
    return Math.min(times * 50, 2000)
  }
}
```

### Queue Configuration

BullMQ queues use Redis for:

* Price monitoring
* Order execution
* Order expiry checks

```typescript
// Queue initialization
export const priceMonitorQueue = new Queue('priceMonitor', { connection })
export const orderExecutionQueue = new Queue('orderExecution', { connection })
export const orderExpiryQueue = new Queue('orderExpiry', { connection })
```

### Security Configuration

1. **Memory Management**:
   * Max memory: 1536MB
   * Eviction policy: allkeys-lru
2. **Persistence**:
   * AOF enabled: `appendonly yes`
   * Volume mounting for data persistence
3.  **Resource Limits**:

    ```yaml
    deploy:
      resources:
        limits:
          memory: 2G
    ```

### Error Handling

```typescript
// Redis error handling
connection.on('error', (error: Error) => {
  console.error('Redis connection error:', error)
})
```

### Health Checks

Monitor Redis health through:

* Connection events
* Queue status
* Memory usage

### Graceful Shutdown

```typescript
async function gracefulShutdown(): Promise<void> {
  await redisInstance.quit()
  await connection.quit()
}
```

The Strike Bot implements a comprehensive Redis setup for session management, job queues, and caching with proper error handling and resource management.
