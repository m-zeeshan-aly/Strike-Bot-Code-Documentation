# Settings Service

The Settings Service manages user preferences and configuration settings for the Strike Bot. It provides a centralized way to handle user-specific settings and global configurations.

### Core Features

* User preferences management
* Default settings templates
* Setting validation
* Bulk settings updates
* Settings migration

### Core Methods

```typescript
class SettingsService {
  // Get user settings
  async getUserSettings(
    telegramId: number
  ): Promise<UserSettings>

  // Update user settings
  async updateSettings(
    telegramId: number,
    settings: Partial<UserSettings>
  ): Promise<boolean>

  // Reset settings to default
  async resetToDefault(
    telegramId: number
  ): Promise<boolean>

  // Get global settings
  async getGlobalSettings(): Promise<GlobalSettings>
}

interface UserSettings {
  slippageTolerance: number
  priorityFee: number
  defaultSwapSize: number
  autoConfirm: boolean
  notifications: NotificationPreferences
  customFees: CustomFeeSettings
}
```

### Usage Example

```typescript
const settingsService = new SettingsService();

// Get user settings
const settings = await settingsService.getUserSettings(
  userTelegramId
);

// Update specific settings
await settingsService.updateSettings(
  userTelegramId,
  {
    slippageTolerance: 1.0,
    priorityFee: 0.00001
  }
);

// Reset to defaults
await settingsService.resetToDefault(userTelegramId);
```

### Default Settings

```typescript
const DEFAULT_SETTINGS = {
  slippageTolerance: 0.5,    // 0.5%
  priorityFee: 0.000005,     // SOL
  defaultSwapSize: 0.1,      // SOL
  autoConfirm: false,
  notifications: {
    swaps: true,
    priceAlerts: true,
    commissions: true
  },
  customFees: {
    enabled: false,
    percentage: 0.1
  }
}
```

### Features

* Per-user settings persistence
* Setting validation and constraints
* Default value management
* Setting category organization
* Migration utilities for setting updates
