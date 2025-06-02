# DexScreener

## DexScreener API

### Overview

DexScreener API provides comprehensive data about tokens and trading pairs on the Solana blockchain. Strike Bot uses this API primarily for fetching token prices, liquidity information, and market capitalization data, with a fallback to Jupiter Price API when needed.

### Key Features

* Real-time token pricing data
* Trading pair information
* Liquidity metrics
* Market capitalization data
* Historical price data
* Rate limiting with circuit breaker pattern

### API Endpoints

#### Token Information Endpoint

```
GET https://api.dexscreener.com/tokens/v1/{chainId}/{tokenAddress}
```

**Parameters:**

* `chainId`: The blockchain network (use 'solana')
* `tokenAddress`: Mint address of the token

**Response Example:**

```json
[
  {
    "chainId": "solana",
    "dexId": "raydium",
    "pairAddress": "58oQChx4yWmvKdwLLZzBi4ChoCc2fqCUWBkwMihLYQo2",
    "baseToken": {
      "address": "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v",
      "name": "USD Coin",
      "symbol": "USDC"
    },
    "quoteToken": {
      "address": "So11111111111111111111111111111111111111112",
      "name": "Wrapped SOL",
      "symbol": "SOL"
    },
    "priceNative": "0.03846153846153846",
    "priceUsd": "7.65",
    "liquidity": {
      "usd": 5678900
    },
    "volume": {
      "h24": 1234567
    },
    "priceChange": {
      "h24": 2.5,
      "h6": 1.2,
      "h1": 0.5
    },
    "txns": {
      "h24": {
        "buys": 456,
        "sells": 123
      }
    },
    "fdv": 765000000,
    "marketCap": 500000000
  }
]
```

### Implementation in Strike Bot

DexScreener API is primarily utilized through the `DexScreenerPriceService` class in `src/bot/services/dexScreenerPrice.service.ts`.

#### Key Methods

```typescript
// Get price for a single token
async getTokenPrice(tokenAddress: string): Promise<number>

// Get prices for multiple tokens (batched for efficiency)
async getTokenPrices(tokenAddresses: string[]): Promise<Map<string, number>>

// Internal method with circuit breaker pattern
private async fetchPriceWithCircuitBreaker(tokenAddress: string): Promise<number>
```

#### Advanced Features

1. **Circuit Breaker Pattern**: Automatically falls back to Jupiter API if DexScreener API fails multiple times
2. **Rate Limiting**: Respects the API's 300 requests/minute limit
3. **Caching**: Caches responses for 60 seconds to reduce API calls
4. **Batch Processing**: Handles multiple token requests efficiently

### Rate Limits

* Free tier: 300 requests per minute
* The service implements a 280 requests/minute limit for safety

### Example Usage

```typescript
// Get token price
const priceService = new DexScreenerPriceService()
const tokenPrice = await priceService.getTokenPrice('EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v')
console.log(`Current price: $${tokenPrice}`)

// Get multiple token prices
const tokenAddresses = [
  'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v',
  'So11111111111111111111111111111111111111112'
]
const prices = await priceService.getTokenPrices(tokenAddresses)
```

### Best Practices

1. Always handle API failures with appropriate error handling
2. Use the batch endpoint for multiple tokens to reduce API calls
3. Implement caching for frequently queried tokens
4. Add circuit breaker pattern to handle API outages
5. Consider token price staleness and implement refresh strategies
