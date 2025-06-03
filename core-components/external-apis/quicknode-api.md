# QuickNode API

### Overview

The QuickNode API provides specialized services for the Solana blockchain, including token swap functionality via the Jupiter Swap API and fast, reliable token price data via the Jupiter Price API. Strike Bot leverages these APIs for executing token swaps with optimal pricing and minimal slippage, as well as fetching token prices with fallback support when primary sources are unavailable.

### Key Features

* **Jupiter Swap API:**
  * Optimal swap routing across multiple DEXes
  * Real-time price quoting
  * Slippage control
  * Platform fee support
  * Priority fee management for faster transactions
  * Automatic SOL wrapping/unwrapping
* **Jupiter Price API:**
  * Fast and reliable token pricing
  * Batch price queries for multiple tokens
  * Customizable price quotation token (vs\_token)
  * Market data caching options
  * Route restriction capabilities
  * Real-time price updates

### QuickNode Plan Details

This project uses the QuickNode "Build" plan, which costs $49/month and includes the following:

* **80 million API credits** per month (at a rate of 0.62 credits per 1 million API credits)
* **50 requests per second** limit
* **10 GB for streams**
* **500 GB/s for functions**
* **10 GB for IPFS**

#### User Capacity and Scaling

The "Build" plan supports a moderate number of users, suitable for small to medium-scale projects. Based on the 50 requests/second limit, it can handle approximately **180,000 requests per hour** (50 requests/second × 3600 seconds). Assuming an average user makes 10 requests per hour (e.g., quotes, swaps, and price checks), this plan can support around **18,000 users per hour** at peak load. However, this is a rough estimate and depends on usage patterns, such as the frequency of swaps and price queries.

If you need to support more users or increase capacity (e.g., for higher request rates or larger data needs), you can upgrade to a higher QuickNode plan. Visit the [QuickNode pricing page](https://www.quicknode.com/pricing) to explore other plans with increased API credits, request limits, and storage options. For custom scaling needs, you can also contact QuickNode support for enterprise solutions.
