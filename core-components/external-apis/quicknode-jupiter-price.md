# QuickNode Jupiter Price

## Jupiter Price API

### Overview

The Jupiter Price API provides fast and reliable token price data on the Solana blockchain. Strike Bot uses this API as a fallback for token pricing when the primary price source (DexScreener) is unavailable or returns incomplete data.

### Key Features

* Fast and reliable token pricing
* Batch price queries for multiple tokens
* Customizable price quotation token (vs\_token)
* Market data caching options
* Route restriction capabilities
* Real-time price updates

### API Endpoints

#### Price Endpoint

```
GET https://{quicknode_url}/{api_key}/price
```

**Parameters:**

* `ids`: Comma-separated list of token mint addresses
* `vsToken`: Token to quote prices against (default: USDT)
* `useQNMarketCache`: Whether to use QuickNode's market cache (boolean)
* `restrictIntermediateTokens`: Whether to restrict intermediate tokens in routes (boolean)
* `onlyDirectRoutes`: Whether to only use direct routes (boolean)

**Response:**

```json
{
  "data": {
    "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v": {
      "id": "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v",
      "mintSymbol": "USDC",
      "vsToken": "USDT",
      "vsTokenSymbol": "USDT",
      "price": 0.999
    },
    "So11111111111111111111111111111111111111112": {
      "id": "So11111111111111111111111111111111111111112",
      "mintSymbol": "SOL",
      "vsToken": "USDT",
      "vsTokenSymbol": "USDT",
      "price": 65.42
    }
  }
}
```

### Implementation in Strike Bot

The Jupiter Price API is used in two main contexts:

1. As a primary pricing source in `src/bot/helpers/utils/solana.utils.ts`
2. As a fallback pricing source in `src/bot/services/dexScreenerPrice.service.ts`

### QuickNode Plan Details

This project uses the QuickNode "Build" plan, which costs $49/month and includes the following:

* **80 million API credits** per month (at a rate of 0.62 credits per 1 million API credits)
* **50 requests per second** limit
* **10 GB for streams**
* **500 GB/s for functions**
* **10 GB for IPFS**

#### User Capacity and Scaling

The "Build" plan supports a moderate number of users, suitable for small to medium-scale projects. Based on the 50 requests/second limit, it can handle approximately **180,000 requests per hour** (50 requests/second × 3600 seconds). Assuming an average user makes 10 requests per hour (e.g., quotes and swaps), this plan can support around **18,000 users per hour** at peak load. However, this is a rough estimate and depends on usage patterns, such as the frequency of swaps and quote requests.

If you need to support more users or increase capacity (e.g., for higher request rates or larger data needs), you can upgrade to a higher QuickNode plan. Visit the [QuickNode pricing page](https://www.quicknode.com/pricing) to explore other plans with increased API credits, request limits, and storage options. For custom scaling needs, you can also contact QuickNode support for enterprise solutions.

#### Key Function

```typescript
/**
 * Fetches the price of one or multiple tokens using QuickNode's Jupiter price API
 */
export async function getTokenPrice(
  ids: string[],
  options: TokenPriceOptions = {},
): Promise<{ [mintAddress: string]: TokenPriceInfo }> {
  try {
    const {
      vsToken = 'USDT',
      useQNMarketCache = false,
      restrictIntermediateTokens = false,
      onlyDirectRoutes = false,
    } = options

    const params = new URLSearchParams({
      ids: ids.join(','),
      vsToken,
      useQNMarketCache: String(useQNMarketCache),
      restrictIntermediateTokens: String(restrictIntermediateTokens),
      onlyDirectRoutes: String(onlyDirectRoutes),
    })

    const url = `${env.QUICKNOTE_JUPITER_SWAP_API}${env.QUICKNODE_API_KEY}/price?${params}`
    const response = await fetch(url)

    // Parse and return the price data
    const priceData = await response.json()
    return priceData.data || {}
  }
  catch (error) {
    console.error('Error fetching token price:', error)
    throw new Error(`Failed to fetch token price: ${error.message}`)
  }
}
```

### Example Usage

```typescript
// Get price for a single token
const usdcPrice = await getTokenPrice(['EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v'])
console.log(`USDC price: $${usdcPrice.EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v.price}`)

// Get prices for multiple tokens
const tokenAddresses = [
  'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v', // USDC
  'So11111111111111111111111111111111111111112' // SOL
]
const prices = await getTokenPrice(tokenAddresses)

// Process the prices
for (const [address, data] of Object.entries(prices)) {
  console.log(`${data.mintSymbol}: $${data.price}`)
}
```

### Best Practices

1. Use batch queries to get prices for multiple tokens in a single API call
2. Implement caching for frequently queried token prices
3. Handle API errors with fallback mechanisms
4. Consider using a different `vsToken` for specialized trading pairs
5. Monitor token prices for significant changes to detect market anomalies
