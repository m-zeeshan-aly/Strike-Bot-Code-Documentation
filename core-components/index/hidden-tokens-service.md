# Hidden Tokens Service

The Hidden Tokens Service manages user-specific token visibility preferences in the Strike Bot. It allows users to hide tokens they don't want to see in their trading interface.

### Core Features

* Token visibility management
* Per-user token lists
* Bulk token operations
* Token validation

### Core Methods

```typescript
class HiddenTokensService {
  // Hide a token for a user
  async hideToken(
    telegramId: number,
    tokenAddress: string
  ): Promise<boolean>

  // Unhide a token for a user
  async unhideToken(
    telegramId: number,
    tokenAddress: string
  ): Promise<boolean>

  // Get user's hidden tokens
  async getHiddenTokens(
    telegramId: number
  ): Promise<string[]>

  // Check if token is hidden
  async isTokenHidden(
    telegramId: number,
    tokenAddress: string
  ): Promise<boolean>
}
```

### Usage Example

```typescript
const hiddenTokensService = new HiddenTokensService();

// Hide a token
await hiddenTokensService.hideToken(
  userTelegramId,
  tokenAddress
);

// Get hidden tokens list
const hiddenTokens = await hiddenTokensService.getHiddenTokens(
  userTelegramId
);

// Check token visibility
const isHidden = await hiddenTokensService.isTokenHidden(
  userTelegramId,
  tokenAddress
);
```

### Database Schema

```typescript
interface HiddenTokensDocument {
  userId: number          // Telegram ID
  tokens: string[]       // Array of hidden token addresses
  lastUpdated: Date     // Last modification timestamp
}
```

### Features

* Persistent storage of hidden token preferences
* Token address validation
* Automatic cleanup of invalid tokens
* Batch operations support
* Migration utilities
