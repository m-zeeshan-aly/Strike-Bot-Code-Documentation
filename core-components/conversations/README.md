# Conversations

## Bot Conversations Overview

The bot utilizes grammY's conversation plugin to handle complex user interactions for trading functions on the Solana blockchain. The conversation system enables stateful interactions and complex multi-step workflows.

### Core Components

#### 1. Trading Settings Conversations

```typescript
// Feature: Buy/Sell Settings
setBuySellAmountConversation: {
  - Configure custom buy/sell amounts (MIN: 0.001 SOL)
  - Validate amounts and store in user settings
  - Update session with new preferences
}

setBuySellSlippageConversation: {
  - Set slippage tolerance (Range: 0.1% - 100%)
  - Separate configurations for buy/sell
  - Persistent settings storage
}
```

#### 2. Token Operations

```typescript
// Feature: Token Management
buyTokenConversation: {
  - Accept token address or symbol input
  - Validate SPL token existence
  - Market data verification
  - Initialize trade session
}

hideTokenConversation: {
  - Add tokens to hidden list
  - Manage token visibility
  - Update user preferences
}
```

#### 3. Order Management

```typescript
// Feature: Custom Orders
customSolAmountConversation: {
  - Set custom SOL amounts for trades
  - Input validation and limits
  - Real-time balance checks
}

customSellPercentConversation: {
  - Percentage-based selling
  - Dynamic amount calculation
  - Balance verification
}
```

#### 4. Limit Orders

```typescript
// Feature: Advanced Trading
triggerPriceConversation: {
  - Set price triggers
  - Support multiple formats (%, $, M)
  - Market validation
}

expiryConversation: {
  - Configure order expiration
  - Time-based settings
  - Auto-cancellation
}
```

### Implementation Pattern

#### 1. Conversation Structure

```typescript
export async function conversationHandler(conversation: MyConversation, ctx: MyContext) {
  // 1. Initial prompt
  await ctx.reply('Enter required information')

  // 2. Wait for response
  const response = await conversation.wait()

  // 3. Validation
  try {
    // Validate input
    // Process data
    // Update session

    // 4. Success feedback
    await ctx.reply('✅ Operation successful')
  } catch (error) {
    // 5. Error handling with retry
    const retryKeyboard = new InlineKeyboard()
      .text('Retry', 'retry_action')
    await ctx.reply('❌ Error message', { reply_markup: retryKeyboard })
  }
}
```

#### 2. Session Management

```typescript
// Session data structure
interface SessionData {
  trade: {
    tokenAddress?: string
    tradeInstruction?: 'Buy' | 'Sell'
    swapAmount?: number
    slippagePercentage?: number
  }
  settings: {
    data: ISettings
    lastUpdated: number
  }
}
```

### Error Handling

All conversations implement robust error handling:

* Input validation
* Balance verification
* Network error recovery
* User-friendly error messages
* Retry mechanisms

### Integration

Conversations are registered in the bot's main file:

```typescript
// Bot initialization
bot.use(conversations())
bot.use(createConversation(buyTokenConversation))
bot.use(createConversation(sellTokenConversation))
bot.use(createConversation(settingsConversation))
// ... other conversations
```

### Best Practices

1. **Input Validation**
   * Always validate user input
   * Provide clear error messages
   * Implement retry mechanisms
2. **State Management**
   * Use session storage for persistence
   * Clear state after completion
   * Handle timeout scenarios
3. **User Experience**
   * Clear instructions
   * Progress feedback
   * Intuitive error recovery
4. **Security**
   * Validate all inputs
   * Check user permissions
   * Implement rate limiting
