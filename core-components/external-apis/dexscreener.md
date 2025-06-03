# DexScreener

### Overview

DexScreener API provides comprehensive data about tokens and trading pairs on the Solana blockchain. Strike Bot uses this API primarily for fetching token prices, liquidity information, and market capitalization data, with a fallback to Jupiter Price API when needed.

### Key Features

* Real-time token pricing data
* Trading pair information
* Liquidity metrics
* Market capitalization data
* Historical price data
* Rate limiting with circuit breaker pattern

#### Advanced Features

1. **Circuit Breaker Pattern**: Automatically falls back to Jupiter API if DexScreener API fails multiple times
2. **Rate Limiting**: Respects the API's 300 requests/minute limit
3. **Caching**: Caches responses for 60 seconds to reduce API calls
4. **Batch Processing**: Handles multiple token requests efficiently

### Rate Limits

* Free tier: 300 requests per minute
* The service implements a 280 requests/minute limit for safety

### User Capacity and Scaling

The DexScreener API is free to use with a rate limit of 300 requests per minute (or 280 requests/minute as implemented for safety). This translates to approximately **18,000 requests per hour** (300 requests/min × 60 min). Assuming an average user makes 5 requests per hour (e.g., checking token prices, liquidity, or market cap), this plan can support around **3,360 users per hour** at peak load. This estimate depends on usage patterns, such as the frequency of API calls and the number of tokens queried.

If you need to support more users or handle higher request volumes, monitor your usage against the rate limit. For potential upgrades or custom solutions (e.g., higher rate limits or additional features), contact DexScreener support via their official website at [DexScreener](https://dexscreener.com/).
