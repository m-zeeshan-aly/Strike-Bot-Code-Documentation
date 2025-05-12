# Execute Swap Service

The Execute Swap Service handles token swaps via the Jupiter Protocol on Solana. It manages the entire swap lifecycle from route finding to execution.

### Core Features

* Best route discovery via Jupiter
* Slippage protection
* Priority fee management
* Transaction monitoring
* Swap confirmation handling

### Core Methods

```typescript
class ExecuteSwapService {
  // Get best swap route
  async getRoute(
    inputToken: string,
    outputToken: string,
    amount: number,
    slippage: number
  ): Promise<RouteInfo>

  // Execute a swap
  async executeSwap(
    route: RouteInfo,
    userAddress: string,
    priorityFee?: number
  ): Promise<SwapResult>

  // Quote swap price
  async getQuote(
    inputToken: string,
    outputToken: string,
    amount: number
  ): Promise<QuoteInfo>
}

interface SwapResult {
  signature: string
  inputAmount: number
  outputAmount: number
  priceImpact: number
  fee: number
}
```

### Usage Example

```typescript
const swapService = new ExecuteSwapService();

// Get swap route
const route = await swapService.getRoute(
  'SOL',
  'USDC',
  1.5, // Amount in SOL
  1.0  // 1% slippage
);

// Execute swap
const result = await swapService.executeSwap(
  route,
  userWalletAddress,
  0.00001 // Priority fee
);

// Get price quote
const quote = await swapService.getQuote(
  'SOL',
  'USDC',
  1.5
);
```

### Configuration Options

* Maximum slippage percentage
* Priority fee strategies
* Retry policies
* RPC endpoints
* Price impact limits

### Error Handling

The service handles common swap errors:

* Insufficient funds
* Route not found
* Price impact too high
* Transaction failure
* RPC node errors
