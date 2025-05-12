# Price Service

The `DexScreenerPriceService` provides token price information using the DexScreener API with fallback to Jupiter.

### Features

* Price fetching with caching (1 minute TTL)
* Rate limiting (280 requests/minute)
* Circuit breaker pattern for API resilience
* Batch price fetching support (up to 30 tokens)

### Core Methods

```typescript
class DexScreenerPriceService {
  // Get single token price
  async getTokenPrice(tokenAddress: string): Promise<number>

  // Get prices for multiple tokens (batched)
  async getTokenPrices(tokenAddresses: string[]): Promise<Map<string, number>>
}
```

### Example Usage

```typescript
const priceService = new DexScreenerPriceService();

// Get single token price
const price = await priceService.getTokenPrice(tokenAddress);

// Get multiple token prices
const prices = await priceService.getTokenPrices([token1, token2]);
```
