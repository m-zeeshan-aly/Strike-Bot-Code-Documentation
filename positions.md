# Positions

### Positions and Portfolio Management in Strike Bot <a href="#positions-and-portfolio-management-in-strike-bot" id="positions-and-portfolio-management-in-strike-bot"></a>

OverviewStrike Bot's Positions feature offers comprehensive portfolio management capabilities, enabling users to monitor, analyze, and manage their Solana token holdings directly within Telegram. This powerful tool provides detailed insights into token performance, trading history, and profitability metrics.

#### Key Features <a href="#key-features" id="key-features"></a>

* **Token Portfolio Overview**: View all tokens in your wallet at a glance
* **Market Data**: Access current price, market cap, and price change information
* **Detailed Token Analytics**: See in-depth information for each token
* **Performance Metrics**: Track PnL (Profit and Loss), entry prices, and value changes
* **Trading Actions**: Buy and sell tokens directly from the Positions menu
* **Transaction History**: View your purchase and sale history for each token
* **Sorting Options**: Sort tokens by value or recent activity
* **Token Selection**: Select specific tokens to view or trade
* **Market Data**: Access current price, market cap, and price change information

#### How to Use Positions <a href="#how-to-use-positions" id="how-to-use-positions"></a>

**Accessing Positions**

Access your positions by:

* Typing `/positions` command
* Selecting "Positions" from the main menu

**Positions Menu Overview**

The Positions menu displays:

* Your wallet address and SOL balance
* Total portfolio value in SOL and USD
* List of all tokens in your wallet with key metrics
* Navigation options for trading actions

**Managing Individual Tokens**

For each token, you can view:

* Current balance and value
* Average entry price
* Total buys and sells (amount and count)
* PnL metrics (percentage and dollar value)
* Price change information

**Trading from Positions**&#x20;

Select a token and choose:

* **Buy Options**: Purchase more of a token using different SOL amounts
* **Sell Options**: Sell token using preset percentages (50%, 100%) or a custom amount
* **Custom Amounts**: Enter specific buy/sell amounts via text input

**Sorting and Organization**

Change how tokens are displayed:

* **Sort by Value**: Displays tokens ordered by their USD value
* **Sort by Recent**: Displays tokens ordered by most recent transaction activity

#### Behind the Scenes <a href="#behind-the-scenes" id="behind-the-scenes"></a>

**Technical Implementation**

The Positions feature is built on several components:

* **Wallet Service**: Securely retrieves token holdings from your Solana wallet
* **Token Data Cache**: Efficiently stores token information to minimize API calls
* **Transaction Service**: Analyzes your trading history for accurate metrics
* **Price Service**: Provides real-time price data from multiple sources
* **PnL Calculator**: Computes profit/loss metrics based on transaction history

**Data Sources**

The Positions feature pulls data from:

* Solana blockchain (for balance information)
* DexScreener (for price and market data)
* Strike Bot transaction history (for buy/sell metrics)
* Token metadata services (for token information)

#### Example Use Cases <a href="#example-use-cases" id="example-use-cases"></a>

**Portfolio Monitoring**

Jane wants to track her Solana investments. Using the Positions menu, she can see her entire portfolio at a glance, including total value, individual token performance, and profit/loss metrics for each position.

**Trading Decision Support**

Tom is considering selling one of his tokens. From the Positions menu, he can see his average entry price, current value, and performance metrics, helping him make an informed decision about whether to sell.

**Quick Trading**

Sarah notices one of her tokens has increased significantly in value. From the Positions menu, she can quickly select the token and execute a sell order, all without leaving the conversation.

#### Important Considerations <a href="#important-considerations" id="important-considerations"></a>

* **Hidden Tokens**: Tokens marked as "hidden" won't appear in your Positions view
* **Performance Data**: PnL calculations are based on tracked transactions
* **Refresh Button**: Use the refresh option to update prices and balances
* **Wallet Security**: Your wallet private key is never exposed during Positions operations
* **Transaction History**: Only transactions made through Strike Bot are included in metrics

#### Troubleshooting <a href="#troubleshooting" id="troubleshooting"></a>

Common issues and solutions:

* **Missing Tokens**: Check if tokens are hidden or have zero balance
* **Outdated Data**: Use the refresh button to update information
* **Calculation Discrepancies**: Small differences may occur due to price fluctuations or gas fees
* **Token Selection**: If token buttons don't respond, try refreshing the Positions menu
