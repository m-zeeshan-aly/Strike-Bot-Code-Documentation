# Middlewares

### Overview

Middlewares in Strike Bot are interceptors that process messages and updates before they reach your command handlers. They help in executing common tasks like logging, settings management, and authentication.

### Available Middlewares

#### 1. Settings Middleware

* Manages user settings and preferences
* Handles caching of settings
* Refreshes settings automatically when needed

#### 2. Update Logger

* Tracks bot interactions
* Records user activities
* Helps in debugging and monitoring

### How Middlewares Work

```typescript
middleware() {
  return async (ctx: MyContext, next: () => Promise<void>) => {
    // Do something before the update
    await next() // Let other middleware/handlers run
    // Do something after
  }
}
```

### Usage

Middlewares are applied to the bot in the following way:

```typescript
bot.use(settingsMiddleware.middleware())
```

### Order of Execution

1. Update Logger (First to execute)
2. Settings Middleware
3. Command Handlers (Last to execute)

Each middleware can:

* Modify the context
* Stop the middleware chain
* Pass control to the next middleware
