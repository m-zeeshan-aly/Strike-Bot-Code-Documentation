# Running the Application

This guide provides instructions for running the Strikebot Dashboard in different environments and modes.

## Development Mode

To run the application in development mode:

```bash
# Start the development server
npm run dev
```

This will start the Next.js development server with:

* Hot module replacement for instant updates
* Detailed error messages with stack traces
* Developer-friendly warnings

The development server will be available at [http://localhost:3000](http://localhost:3000) by default.

### Development Features

When running in development mode, you'll have access to:

* **Fast Refresh**: Components update instantly without losing state
* **Error Overlay**: Detailed error messages display in the browser
* **API Route Development**: Changes to API routes are immediately available
* **Development Logging**: More verbose logging for debugging

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

* **Optimized Performance**: JavaScript and CSS are minified and optimized
* **Static Generation**: Pages that can be statically generated are pre-rendered
* **Server-Side Rendering**: Dynamic pages are rendered on-demand
* **Edge Functions**: Certain functions run at the edge for optimal performance
* **Reduced Log Verbosity**: Only important information is logged
