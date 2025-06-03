# GeckoTerminal

### Overview

GeckoTerminal API provides comprehensive token data for the Solana blockchain. Strike Bot primarily uses this API for token discovery, fetching trending tokens, and gathering token metadata including names, symbols, and addresses.

### Key Features

* Token discovery and search
* Trending token information
* Recently updated token data
* Token metadata retrieval
* Trading pair details

### API Endpoints

#### Recently Updated Tokens

```
GET https://api.geckoterminal.com/api/v2/tokens/info_recently_updated?network=solana
```

**Parameters:**

* `network`: Blockchain network (solana)

**Response Example:**

```json
{
  "data": [
    {
      "id": "solana_EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v",
      "type": "token",
      "attributes": {
        "name": "USD Coin(weight: 2.0)",
        "symbol": "USDC",
        "address": "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v",
        "decimals": 6,
        "total_supply": "5034024380.7",
        "coingecko_coin_id": "usd-coin"
      }
    }
  ]
}
```

#### Token Search

```
GET https://api.geckoterminal.com/api/v2/search?query={searchTerm}&network=solana
```

**Parameters:**

* `query`: Search term for token name or symbol
* `network`: Blockchain network (solana)

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

### Implementation in Strike Bot

The GeckoTerminal API is primarily used through utility functions in `src/bot/helpers/utils/topDexToken.utils.ts`.

#### Key Functions

```typescript
// Fetch trending/top tokens
export async function getTopTokens(limit: number): Promise<TopToken[]>

// Add discovered tokens to the database
export async function addTokensToDb(tokens: TopToken[]): Promise<TopToken[]>
```

#### Token Discovery Flow

1. Fetch recently updated tokens from GeckoTerminal API
2. Process the tokens to extract name, symbol, and address
3. Store tokens in the database if they don't already exist
4. Make tokens available for trading and searching

### Example Usage

```typescript
// Get top 10 recently updated tokens
const topTokens = await getTopTokens(10)
console.log(`Found ${topTokens.length} trending tokens`)

// Add tokens to database
const addedTokens = await addTokensToDb(topTokens)
console.log(`Added ${addedTokens.length} new tokens to the database`)
```

### Integration with DexToken Service

The discovered tokens are stored using the `DexToken` model and managed through the `DexTokenService`:

```typescript
// Add a new token
const newToken = await DexTokenService.addToken(token.name, token.address, token.symbol)

// Search for tokens by name
const searchResults = await DexTokenService.searchTokens('SOL', 10)
```

### Rate Limits

* Standard tier: 100 requests per minute
* No authentication required for basic endpoints

### Best Practices

1. Cache token data to reduce API calls
2. Implement pagination when fetching large token lists
3. Handle API failures gracefully with appropriate fallbacks
4. Store token data locally to reduce dependency on external APIs
5. Refresh token data periodically for accuracy
