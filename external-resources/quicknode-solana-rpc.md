# QuickNode Solana RPC

### Overview

The QuickNode Solana RPC API is the primary interface for interacting with the Solana blockchain in Strike Bot. The project predominantly uses QuickNode's professional RPC services for enhanced reliability, performance, and specialized features not available in public RPC endpoints. This enterprise-grade connection powers all blockchain interactions including wallet management, transaction processing, account data queries, and token operations.

### Key Features

* High-performance, low-latency RPC connections
* Premium transaction processing with priority fees
* Enhanced reliability with dedicated infrastructure
* Advanced caching features for improved response times
* Detailed transaction and account monitoring
* WebSocket support for real-time updates
* Specialized Solana endpoints optimized for trading bots
* Built-in rate limiting and request prioritization

### QuickNode Plan Details

This project uses the QuickNode "Build" plan, which costs $49/month and includes the following:

* **80 million API credits** per month (at a rate of 0.62 credits per 1 million API credits)
* **50 requests per second** limit
* **10 GB for streams**
* **500 GB/s for functions**
* **10 GB for IPFS**

#### User Capacity and Scaling

The "Build" plan supports a moderate number of users, suitable for small to medium-scale projects. Based on the 50 requests/second limit, it can handle approximately **180,000 requests per hour** (50 requests/second × 3600 seconds). Assuming an average user makes 10 requests per hour (e.g., account info, balance checks, and transactions), this plan can support around **18,000 users per hour** at peak load. However, this is a rough estimate and depends on usage patterns, such as the frequency of RPC calls.

If you need to support more users or increase capacity (e.g., for higher request rates or larger data needs), you can upgrade to a higher QuickNode plan. Visit the [QuickNode pricing page](https://www.quicknode.com/pricing) to explore other plans with increased API credits, request limits, and storage options. For custom scaling needs, you can also contact QuickNode support for enterprise solutions.
