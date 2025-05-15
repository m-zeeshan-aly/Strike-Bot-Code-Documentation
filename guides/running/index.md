# Running the Application

This guide provides instructions for running the Strikebot Dashboard in different environments and modes.

## Development Mode

To run the application in development mode:

```bash
# Start the development server
npm run dev
```

This will start the Next.js development server with:
- Hot module replacement for instant updates
- Detailed error messages with stack traces
- Developer-friendly warnings

The development server will be available at [http://localhost:3000](http://localhost:3000) by default.

### Development Features

When running in development mode, you'll have access to:

- **Fast Refresh**: Components update instantly without losing state
- **Error Overlay**: Detailed error messages display in the browser
- **API Route Development**: Changes to API routes are immediately available
- **Development Logging**: More verbose logging for debugging

## Production Mode

To run the application in production mode, you need to build it first and then start the server:

```bash
# Build the application
npm run build

# Start the production server
npm run start
```

The production server will be available at [http://localhost:3000](http://localhost:3000) by default.

### Production Features

Production mode provides:

- **Optimized Performance**: JavaScript and CSS are minified and optimized
- **Static Generation**: Pages that can be statically generated are pre-rendered
- **Server-Side Rendering**: Dynamic pages are rendered on-demand
- **Edge Functions**: Certain functions run at the edge for optimal performance
- **Reduced Log Verbosity**: Only important information is logged

## Environment-Specific Configurations

The application behavior can be customized for different environments using environment variables. See the [Configuration Guide](../configuration/index.md) for details.

## Docker Deployment

You can also run the application in a Docker container:

```bash
# Build the Docker image
docker build -t strikebot-dashboard .

# Run the Docker container
docker run -p 3000:3000 strikebot-dashboard
```

## Serverless Deployment

The Strikebot Dashboard can be deployed to serverless platforms like Vercel:

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy to Vercel
vercel
```

## Debugging

### Using the Debug Mode

To start the application in debug mode:

```bash
# Start with Node.js inspector
NODE_OPTIONS='--inspect' npm run dev
```

This allows you to connect with Chrome DevTools by navigating to `chrome://inspect` in your Chrome browser.

### Common Debugging Flags

You can use various flags to control debugging:

```bash
# Enable verbose Next.js logging
DEBUG=next:* npm run dev

# Enable specific subsystem logging
DEBUG=next:router npm run dev
```

## Monitoring

In production, you can monitor the application using:

1. **Built-in Metrics**: Next.js provides built-in metrics for performance monitoring.
2. **External Monitoring**: Services like Datadog, New Relic, or Sentry can be integrated.

## Health Checks

The application exposes a health check endpoint at `/api/health` that returns:

```json
{
  "status": "ok",
  "timestamp": "2023-01-01T00:00:00Z",
  "version": "1.0.0"
}
```

You can use this endpoint to monitor the application's health in production.

## Load Testing

Before deploying to production, it's recommended to perform load testing:

```bash
# Install autocannon
npm install -g autocannon

# Run a basic load test
autocannon -c 100 -d 30 http://localhost:3000
```

## CI/CD Pipeline

The application includes GitHub Actions workflows for continuous integration and deployment:

- **CI Workflow**: Runs tests, linting, and type checking on pull requests
- **CD Workflow**: Deploys the application to staging or production environments when changes are merged

See the [GitHub Actions workflows](.github/workflows) for more details.
