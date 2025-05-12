# PM2 Deployment

### Overview

This guide details the PM2-based deployment setup for the Strike Bot server API. PM2 is used to manage the Node.js process in production, providing process management, monitoring, and automatic restart capabilities.

### PM2 Configuration

#### Core Configuration

The bot uses `ecosystem.config.js` for PM2 process management:

```javascript
export default {
  apps: [
    {
      name: 'strike-bot-server-api',
      script: 'dist/server/index.js',
      cwd: '.',
      instances: 1,
      exec_mode: 'fork',
      watch: false,
      env: {
        NODE_ENV: 'production',
      },
    },
  ],
}
```

#### Configuration Details

* **Application Name**: `strike-bot-server-api`
* **Script Path**: index.js
* **Working Directory**: Project root (`.`)
* **Process Model**: Single instance in fork mode
* **Watch Mode**: Disabled for production stability
* **Environment**: Production settings

### Deployment Commands

#### Initial Deployment

```bash
# Build and start the server
pnpm run pm2:server:start
```

This command:

1. Builds the TypeScript project
2. Starts the PM2 process using ecosystem config

#### Process Management

```bash
# Reload the application
pnpm run pm2:server:reload

# Stop the application
pnpm run pm2:server:stop
```

#### Additional PM2 Commands

```bash
# View process list
pm2 list

# Monitor processes
pm2 monit

# View logs
pm2 logs strike-bot-server-api

# View process details
pm2 show strike-bot-server-api
```

### Process Management in Production

#### Automatic Restart

* PM2 automatically restarts the process if it crashes
* Single instance mode ensures resource efficiency
* Fork execution mode for better process isolation

#### Environment Variables

Required environment variables:

```env
NODE_ENV=production
MONGO_URI=<your-mongodb-uri>
REDIS_SERVER_URL=<your-redis-url>
BOT_TOKEN=<your-bot-token>
# Additional variables from environment.config.ts
```

#### Resource Management

* Single instance deployment
* Process memory automatically managed by PM2
* CPU affinity handled by the fork mode

### Monitoring and Logs

#### Log Management

PM2 provides several logging features:

```bash
# Access application logs
pm2 logs strike-bot-server-api

# Display only error logs
pm2 logs strike-bot-server-api --err

# Clear logs
pm2 flush
```

#### Performance Monitoring

```bash
# Real-time monitoring dashboard
pm2 monit

# Basic status information
pm2 status

# Resource usage statistics
pm2 prettylist
```

#### Health Checks

* Process uptime monitoring
* Memory usage tracking
* Error rate monitoring
* CPU usage statistics

### Integration with Bot Architecture

#### Server Components

The PM2 deployment manages:

* Main server API (`dist/server/index.js`)
* API endpoints (`server/apis/`)
* Service workers (`server/workers/`)
* Queue processors (`server/queues/`)

#### Architectural Integration

```plaintext
PM2 Process
└── Server API (dist/server/index.js)
    ├── API Routes
    ├── Middleware
    ├── Queue Workers
    └── Service Handlers
```

#### Dependencies

* MongoDB connection
* Redis server
* External API integrations

### Maintenance and Updates

#### Deployment Updates

1. Pull latest changes
2.  Build the application:

    ```bash
    pnpm build
    ```
3.  Reload the PM2 process:

    ```bash
    pnpm run pm2:server:reload
    ```

#### Troubleshooting

1.  Check process status:

    ```bash
    pm2 status
    ```
2.  View error logs:

    ```bash
    pm2 logs strike-bot-server-api --err
    ```
3.  Restart on issues:

    ```bash
    pm2 restart strike-bot-server-api
    ```

### Best Practices

1. **Environment Management**
   * Use .env files for local development
   * Set production variables through PM2 ecosystem file
   * Keep sensitive data in secure environment variables
2. **Monitoring**
   * Regularly check PM2 logs
   * Monitor resource usage
   * Set up alerting for critical errors
3. **Backup and Recovery**
   * Maintain PM2 startup scripts
   *   Save PM2 process list:

       ```bash
       pm2 save
       ```
   *   Configure PM2 startup on system reboot:

       ```bash
       pm2 startup
       ```
4. **Security**
   * Run as non-root user
   * Set proper file permissions
   * Keep PM2 and Node.js updated

### Common Issues and Solutions

1. **Process Crashes**
   * Check error logs: `pm2 logs strike-bot-server-api --err`
   * Verify environment variables
   * Check MongoDB and Redis connectivity
2. **Memory Issues**
   * Monitor memory usage: `pm2 monit`
   * Consider adjusting Node.js memory limits
   * Check for memory leaks in application code
3. **Startup Problems**
   * Verify build process completed successfully
   * Check file permissions
   * Ensure all dependencies are installed

