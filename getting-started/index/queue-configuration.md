# Queue Configuration

### Overview

Strike Bot uses BullMQ for managing job queues with Redis as the backend. The system handles transaction processing, price monitoring, and order execution.

### Queue Setup

#### Available Queues

1. **Bot Queues**

```typescript
// Redis connection
const connection = new Redis(REDIS_SERVER_URL, {
  maxRetriesPerRequest: null
})

// Core queues
- priceMonitorQueue    // Price monitoring and alerts
- orderExecutionQueue  // Limit order execution
- orderExpiryQueue    // Order expiration checks
```

2. **Server Queues**

```typescript
- transactionConfirmationQueue  // Transaction verification
```

### Job Scheduling

#### Scheduler Configuration

```typescript
// Example: Transaction confirmation scheduler
await transactionConfirmationQueue.upsertJobScheduler(
  'transaction-confirmation-scheduler',
  { pattern: '*/3 * * * *' }, // Every 3 minutes
  {
    name: 'process-transactions',
    opts: {
      removeOnComplete: {
        age: 86400,  // 24 hours
        count: 50
      },
      removeOnFail: false,
      attempts: 5,
      backoff: {
        type: 'exponential'
      }
    }
  }
)
```

### Retry Policies

#### Default Configuration

* Maximum attempts: 5
* Backoff strategy: Exponential
* Failed jobs retention: Infinite
* Completed jobs retention: 24 hours

#### Error Handling

```typescript
worker.on('failed', (job, error) => {
  console.error(`Job ${job.id} failed:`, error)
})

connection.on('error', (error) => {
  console.error('Redis connection error:', error)
})
```

### Worker Configuration

#### Worker Setup

```typescript
const worker = new Worker(
  'queueName',
  async (job) => {
    // Job processing logic
  },
  {
    connection,
    concurrency: 1
  }
)
```

#### Available Workers

1. **Price Monitor Worker**
   * Monitors token prices
   * Triggers limit orders
   * Real-time price updates
2. **Order Execution Worker**
   * Processes limit orders
   * Handles transaction execution
   * Sends notifications
3. **Transaction Confirmation Worker**
   * Verifies blockchain transactions
   * Updates transaction status
   * Processes commissions

### Queue Maintenance

#### Health Checks

* Monitor Redis connection status
* Track job completion rates
* Watch for failed jobs

#### Graceful Shutdown

```typescript
async function gracefulShutdown() {
  // Close workers
  await closeWorkers()
  
  // Close queues
  await closeQueues()
  
  // Close Redis connection
  await connection.quit()
}
```

#### Monitoring Metrics

* Active jobs count
* Processing time
* Error rates
* Queue lengths

### Best Practices

1. **Job Management**
   * Use unique job IDs
   * Implement proper error handling
   * Set appropriate timeouts
2. **Performance**
   * Monitor queue lengths
   * Adjust concurrency settings
   * Implement batch processing
3. **Maintenance**
   * Regular cleanup of old jobs
   * Monitor Redis memory usage
   * Log important events

### Configuration Parameters

```typescript
const queueConfig = {
  defaultJobOptions: {
    removeOnComplete: {
      age: 86400,    // 24 hours
      count: 50      // Keep last 50
    },
    removeOnFail: false,
    attempts: 5,
    backoff: {
      type: 'exponential',
      delay: 1000    // Initial delay
    }
  },
  settings: {
    maxStalledCount: 3,
    stalledInterval: 30000,
    lockDuration: 30000
  }
}
```

### Error Codes and Handling

| Error Code    | Description            | Action         |
| ------------- | ---------------------- | -------------- |
| QUEUE\_ERROR  | Queue processing error | Retry job      |
| REDIS\_ERROR  | Redis connection issue | Reconnect      |
| WORKER\_ERROR | Worker process failed  | Restart worker |
| STALLED\_JOB  | Job exceeded lock time | Requeue        |

