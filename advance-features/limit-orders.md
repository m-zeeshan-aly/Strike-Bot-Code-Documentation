# Limit Orders

Overview

Strike Bot's limit order system enables users to set up conditional trades that will execute automatically when specific price conditions are met. This feature allows traders to enter or exit positions at their preferred price points without the need to constantly monitor the market.Key Features

* **Buy Limit Orders**: Automatically purchase tokens when the price falls to a specified target
* **Sell Limit Orders**: Automatically sell tokens when the price rises to a specified target
* **Custom Expiry Settings**: Set how long orders remain active (from minutes to days)
* **Order Management**: View, edit, and cancel limit orders at any time
* **Real-time Price Monitoring**: Continuous monitoring of token prices
* **Automatic Execution**: Orders execute without user intervention when conditions are met
* **Notifications**: Receive alerts about order execution, expiry, or issues

#### How to Use Limit Orders <a href="#how-to-use-limit-orders" id="how-to-use-limit-orders"></a>

**Creating a Limit Order**

* Start by selecting a token to trade (either from your portfolio or by entering a token address)
* Choose "Limit" mode instead of "Swap" mode on the trade screen
* For buy orders: set the amount of SOL you want to spend
* For sell orders: set the percentage of your token holdings to sell
* Set your target price (trigger price)
* Set the expiry time for your order
* Set your slippage tolerance

1. Review and confirm the order

**Managing Limit Orders**

Access your limit orders by:

* Typing `/limitorders` command
* Navigating to the "Limit Orders" option from the main menu

From the limit orders screen, you can:

* View all active orders
* Search for orders by token
* View order details (token, amount, trigger price, expiry time)
* Edit order parameters (amount, trigger price, slippage, expiry)
* Cancel individual orders or all orders at once

#### Behind the Scenes <a href="#behind-the-scenes" id="behind-the-scenes"></a>

**Order Lifecycle**

* **Creation**: Order is saved to the database with status "active"
* **Monitoring**: Prices for tokens with active orders are checked regularly
* **Execution**: When price conditions are met, the order is executed via Jupiter swap
* **Completion**: Order status is updated to "executed", "expired", or "failed"

1. **Notification**: User is notified about the order outcome

**Technical Implementation**

The limit order system consists of several components:

* **Order Database**: MongoDB schema for storing order details
* **Price Monitoring Worker**: Background worker that checks prices regularly
* **Order Execution Worker**: Processes triggered orders
* **Order Expiry Worker**: Cleans up expired orders
* **Notification System**: Sends alerts to users about order status

#### Example Scenarios <a href="#example-scenarios" id="example-scenarios"></a>

**Buy Limit Order**

Anna sees a token trading at $0.50 but believes it will drop to $0.40 before rising again. She sets a buy limit order for 5 SOL at a trigger price of $0.40 with a 3-day expiry. If the price drops to $0.40 within 3 days, her order will automatically execute, purchasing the token with her 5 SOL.

**Sell Limit Order**

Bob holds a token currently trading at $1.20 and wants to lock in profits if it reaches $1.50. He creates a sell limit order for 50% of his holdings with a trigger price of $1.50 and a 7-day expiry. If the price rises to $1.50 within 7 days, half of his tokens will be automatically sold.

#### Important Considerations <a href="#important-considerations" id="important-considerations"></a>

* **Expiry Time**: Orders will automatically expire after the set time period
* **Available Balance**: Ensure you have sufficient SOL/tokens when the order executes
* **Price Volatility**: Rapid price movements can affect execution
* **Gas Fees**: Each transaction requires a small amount of SOL for gas
* **Platform Fees**: A small percentage fee applies to each successful order

#### Troubleshooting <a href="#troubleshooting" id="troubleshooting"></a>

Common issues and solutions:

* **Order Not Executing**: Verify price conditions and check if the order has expired
* **Failed Execution**: Usually due to insufficient balance at execution time
* **Missing Orders**: Orders disappear when executed, expired, or canceled

**Editing Issues**: Some parameters may not be editable after creation
