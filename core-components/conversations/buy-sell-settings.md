# Buy/Sell Settings

## Buy/Sell Settings Conversations

Bot conversations for configuring trade parameters like amounts and slippage settings.

### Key Features

* Configure custom trade amounts
  * Buy: Custom SOL amounts (min 0.001 SOL)
  * Sell: Custom percentage amounts (1-100%)
* Slippage tolerance settings (0.1% - 100%)
* Separate configurations for buy/sell operations
* Settings persist in user session

### Usage Flow

1. User selects edit button for amount/slippage
2. Bot prompts for new value
3. Input validation ensures safe ranges
4. Setting is saved and keyboard updates

### Conversations

* **Amount Settings**
  * Configure preset buy amounts in SOL
  * Configure preset sell percentages
  * Validates min/max limits
* **Slippage Settings**
  * Set slippage tolerance per operation
  * Shared validation logic
  * Updates immediately
