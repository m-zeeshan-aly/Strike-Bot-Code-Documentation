# Settings Middleware

### Overview

The Settings Middleware is a crucial component of the Strike Bot that handles user settings initialization and management within the bot's session. It ensures that user settings are properly loaded, cached, and refreshed when needed.

### Implementation Details

#### Class Structure

```typescript
export class SettingsInitMiddleware implements MiddlewareObj<MyContext> {
  private settingsService: SettingsService
}
```

The middleware is implemented as a class that implements the `MiddlewareObj` interface from Grammy, specialized for our custom `MyContext` type.

#### Configuration Constants

```typescript
const SETTINGS_REFRESH_INTERVAL = 300000 // 5 minutes in milliseconds
```

* `SETTINGS_REFRESH_INTERVAL`: Defines how often the settings should be refreshed from the database (5 minutes)

#### Constructor

```typescript
constructor() {
  this.settingsService = new SettingsService()
}
```

The constructor initializes:

* `settingsService`: An instance of SettingsService for handling settings-related database operations

#### Middleware Function

The middleware function is the core of this implementation. Here's how it works:

```typescript
middleware() {
  return async (ctx: MyContext, next: () => Promise<void>) => {
    // Implementation
  }
}
```

**Flow Control**

1.  **User Validation**

    ```typescript
    if (!ctx.from?.id) {
      return next()
    }
    ```

    * Checks if the update is from a valid user
    * Skips processing for non-user updates (channels/groups)
2.  **Refresh Check**

    ```typescript
    const telegramId = ctx.from.id
    const currentTime = Date.now()

    let needSettingsRefresh = true
    if (ctx.session?.settings) {
      const timeSinceLastUpdate = currentTime - ctx.session.settings.lastUpdated
      needSettingsRefresh = timeSinceLastUpdate > SETTINGS_REFRESH_INTERVAL
    }
    ```

    * Gets the user's Telegram ID
    * Determines if settings need to be refreshed based on the last update time
    * Default to refresh if no settings exist
3.  **Settings Update**

    ```typescript
    if (needSettingsRefresh) {
      const settings = await this.settingsService.getUserSettings(telegramId)
      ctx.session.settings = {
        data: settings,
        lastUpdated: currentTime,
      }
      ctx.session.__settings_initialized = true
    }
    ```

    * Fetches fresh settings if needed
    * Updates the session with new settings
    * Marks settings as initialized
4.  **Error Handling**

    ```typescript
    try {
      // ... implementation ...
    } catch (error) {
      console.error('Error in settings middleware:', error)
      return next()
    }
    ```

    * Wraps all operations in try-catch
    * Logs errors but allows the bot to continue functioning

### Session Data Structure

The middleware maintains the following session structure:

```typescript
{
  settings: {
    data: UserSettings,    // The actual settings data
    lastUpdated: number    // Timestamp of last update
  },
  __settings_initialized: boolean  // Flag indicating initialization status
}
```

### Usage

To use this middleware in your bot:

```typescript
import { SettingsInitMiddleware } from './middlewares/settings-init.middleware'

// Initialize the middleware
const settingsMiddleware = new SettingsInitMiddleware()

// Add to your bot
bot.use(settingsMiddleware.middleware())
```

### Important Notes

1. Settings are cached in the session for 5 minutes to reduce database load
2. Failed settings operations won't block bot functionality
3. Settings are only processed for direct user interactions
4. The middleware automatically handles settings initialization for new users

### Dependencies

* `MyContext`: Custom context type extending Grammy's Context
* `SettingsService`: Service class for database operations
* `MiddlewareObj` from Grammy: Interface for middleware implementation
