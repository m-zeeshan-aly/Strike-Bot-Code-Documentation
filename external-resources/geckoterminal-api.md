# GeckoTerminal API

### Overview

GeckoTerminal API provides comprehensive token data for the Solana blockchain. Strike Bot primarily uses this API for token discovery, fetching trending tokens, and gathering token metadata including names, symbols, and addresses.

### Key Features

* Token discovery and search
* Trending token information
* Recently updated token data
* Token metadata retrieval
* Trading pair details

### CoinGecko Plan Details

This project uses the CoinGecko "Analyst" plan, which costs $129/month and includes the following:

* **500,000 call credits** per month
* **500 requests per minute** rate limit
* Access to **60+ market data endpoints**
* Access to **2M+ tokens**
* Data freshness from **30 seconds**
* **1 year** of coin historical data (daily)
* **1 day** of coin historical data (hourly and 5-minute intervals)
* **From 2018** for exchange historical data
* **10 API keys**
* Commercial license
* Exclusive data endpoints: NFT market data (full), historical global market cap, on-chain DEX data

#### User Capacity and Scaling

The "Analyst" plan is designed for medium to large-scale projects. With a rate limit of 500 requests per minute, it can handle up to **1,800,000 requests per hour** (500 requests/min × 60 minutes × 60 seconds). Assuming an average user makes 10 requests per hour (e.g., token searches, metadata retrievals), this plan can support approximately **180,000 users per hour** at peak load. This estimate varies based on usage patterns, such as the frequency of API calls for token discovery or historical data.

If you need to support more users, increase request limits, or access additional features (e.g., WebSocket early access, historical circulating supply), you can upgrade to a higher CoinGecko plan. Visit the [CoinGecko pricing page](https://www.coingecko.com/en/api/pricing) for more details on other plans with higher call credits, rate limits, and exclusive endpoints. For custom needs, you can also contact CoinGecko support for enterprise solutions.

