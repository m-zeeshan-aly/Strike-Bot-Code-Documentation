# Key Features

The Strike Bot offers a robust set of features tailored for trading on the Solana blockchain, enhanced with user-friendly tools, reward systems, and strong security measures. Below are the primary features that define the bot’s capabilities.

### Trading Capabilities

* **Fast Token Swaps**: Execute quick and efficient token swaps on the Solana blockchain.
* **Custom Slippage Settings**: Configure slippage tolerance to optimize trade execution.
* **Real-Time Price Monitoring**: Access live price updates via DexScreener integration.
* **Market and Limit Orders**: Support for both immediate market orders and conditional limit orders.
* **Position Management**: Track and manage open trading positions with ease.
* **Multiple Token Pair Support**: Trade across a variety of token pairs using Jupiter Aggregator.

### Advanced Order Systems

* **Limit Order Functionality**: Create orders to execute at specific price points (`limitOrder.feature.ts`).
* **Price Monitoring System**: Continuously monitor market prices for timely order execution.
* **Auto-Execution**: Automatically trigger orders when price conditions are met.
* **Order Expiry Management**: Set and manage expiration times for limit orders.
* **Position Tracking**: Monitor ongoing positions with real-time updates (`positions.feature.ts`).

### User Management

* **Secure Wallet Integration**: Safely connect user wallets with encrypted key storage (`walletService.helper.ts`).
* **Persistent User Settings**: Save and retrieve user preferences via MongoDB (`settings.service.ts`).
* **Custom Trading Preferences**: Tailor trading settings like slippage and amounts (`buy-sell-settings.conversation.ts`).
* **Balance Tracking**: View real-time account balances through the bot interface.
* **Transaction History**: Access detailed records of past trades and transactions.

### Reward Systems

* **Weekly Prize Pool**: Participate in weekly prize draws with entries earned through trading (1 entry per $100 traded).
* **Referral Program**: Earn commissions for referrals:
  * 50% commission for direct referrals.
  * 10% commission for indirect referrals.
* **Prize Pool Entries**: Automatically accrue entries based on trading volume (`comission.service.ts`).

### Security Features

* **Encrypted Private Key Storage**: Protect wallet keys with secure encryption (`walletService.helper.ts`).
* **Session Management**: Maintain secure user sessions using Redis (`RedisAdapter`).
* **Rate Limiting**: Prevent abuse with action limits across services.
* **Error Handling and Recovery**: Ensure stability with robust error management (`executeSwap.service.ts`).
* **Secure Withdrawal System**: Safely withdraw funds with validation checks (`withdrawCustomPercentage.conversation.ts`).

### Bot Commands

* `/start`: Initialize the bot and set up a user wallet.
* `/settings`: Configure trading and bot preferences.
* `/help`: Display available commands and support information.
* `/withdraw`: Initiate the withdrawal process for funds.
* `/buy`: Execute a token purchase (`buyToken.feature.ts`).
* `/sell`: Sell tokens from the user’s wallet (`sellToken.feature.ts`).
* `/limitorders`: Manage limit orders (`limitOrder.feature.ts`).
* `/positions`: View current trading positions (`positions.feature.ts`).
