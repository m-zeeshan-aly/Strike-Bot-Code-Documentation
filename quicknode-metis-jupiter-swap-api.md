# QuickNode Metis Jupiter Swap API

### **Plan Information**

* **Plan**: Launch
* **Monthly Cost**: $249 USD
* **Performance**: Up to 50 RPS (Requests Per Second)
* **Monthly Requests**: Up to 130,000,000 requests per month

### Key Features

#### Platform Fee Integration

* **Platform Fee Support**: Set platform fees on quotes using `platformFeeBps` parameter
* **Revenue Generation**: Charge fees directly through the API integration

#### Performance & Reliability

* **Fresh Data**: Markets and pools show up immediately due to rolling restarts
* **Elite Latency**: Minimal latency for faster quotes compared to public APIs
* **High Throughput**: 50 requests per second capacity

#### Advanced APIs Access

* **Pump.fun APIs**: Full access to pump.fun trading APIs
* **Jupiter Limit Order APIs**: Complete limit order functionality
* **Specialized Endpoints**: Access to premium trading features

#### Core Swap Functionality

**Quote Generation**

* **Smart Routing**: Get the best routes for any swap pair
* **Optimal Pricing**: Automatic route optimization for best execution
* **Slippage Control**: Customizable slippage parameters
* **Real-time Quotes**: Live pricing data for accurate trading

**Transaction Building**

* **Serialized Transactions**: Get ready-to-submit swap transactions
* **Custom Instructions**: Individual instruction composition for advanced integrations
* **Multiple Endpoints**: Both `/swap` and `/swap-instructions` endpoints available

### Technical Specifications

#### Request Limits

* **Rate Limit**: 50 requests per second
* **Monthly Quota**: 130,000,000 requests
* **Burst Capacity**: Handles traffic spikes efficiently

#### Integration Benefits

* **Direct Jupiter Integration**: Native Jupiter DEX aggregator access
* **QuickNode Infrastructure**: Enterprise-grade reliability and uptime
* **Optimized Performance**: Faster than public Jupiter APIs

### Use Cases in Strike Bot

#### Primary Functions

* **Token Swaps**: Execute buy/sell operations through Jupiter aggregator
* **Price Fetching**: Real-time token price data with fallback support
* **Quote Generation**: Get optimal swap routes and pricing
* **Fee Collection**: Platform fee integration for revenue generation

#### Technical Implementation

* **Swap Service**: `JupiterSwapService` class utilizes QuickNode endpoints
* **Price Service**: `DexScreenerPriceService` uses QuickNode as fallback
* **Environment Integration**: `QUICKNOTE_JUPITER_SWAP_API` configuration

***

_This plan provides enterprise-level Jupiter API access with enhanced performance and additional features compared to the standard public APIs._
