# Bot Configuration

### 1. Core Configuration Options

#### Environment Variables

```typescript
BOT_TOKEN=your_telegram_bot_token
BOT_USERNAME=your_bot_username
BOT_MODE=polling  // or 'webhook'
```

#### Base Settings

* Transaction speeds: `fast`, `turbo`, `custom`
* Fee configurations: Platform fee, MEV protection
* Security settings: Trade confirmations, Sell protection
* UI preferences: Chart previews, PNL display

### 2. Settings Management

Settings are managed through a layered system:

* User-specific settings in MongoDB
* Session-based settings via Redis
* Default fallback settings

```typescript
// Default Settings Structure
{
  transactionSpeed: 'fast',
  confirmTrades: false,
  mevProtectBuy: false,
  mevProtectSell: false,
  sellProtection: false,
  buyAmounts: [0.5, 1, 3, 5, 10],
  buySlippage: 15,
  sellAmounts: [50, 100],
  sellSlippage: 15,
  chartPreviews: false
}
```

### 3. Available Commands

```
/start      - Start the bot
/buy        - Buy tokens
/sell       - Sell tokens
/positions  - View holdings
/settings   - Adjust settings
/limitorders- Manage limit orders
/withdraw   - Withdraw funds
/help       - Show help
```

### 4. Middleware Configuration

* Settings initialization middleware
* Session management with Redis
* Update logging middleware
* Error handling middleware

### 5. Keyboard & Conversation Handlers

#### Main Keyboards

* Start Menu
* Buy/Sell Menus
* Settings Menu
* Position Management
* Limit Order Management

#### Conversation Handlers

```typescript
// Core Conversations
- buyTokenConversation
- customSolAmountConversation
- settingsCustomFeeConversation
- limitOrderConversation
- withdrawConversation
```

### 6. Bot Behavior Configuration

#### Transaction Settings

* Slippage tolerance
* Transaction speed
* MEV protection
* Fee customization

#### Security Features

* Trade confirmation
* Sell protection
* Account security
* Wallet management

#### UI Customization

* Chart previews
* PNL display options
* Token visibility
* Language preferences

```

This documentation covers the essential configuration aspects of the Strike Bot while keeping it concise and focused on the key elements needed for operation and customization.

Let me know if you need more details about any specific section!
```
