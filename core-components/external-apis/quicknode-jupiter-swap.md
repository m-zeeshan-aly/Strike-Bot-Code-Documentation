# QuickNode Jupiter Swap

### Overview

The QuickNode Jupiter Swap API is a specialized service that provides token swap functionality on the Solana blockchain. Strike Bot leverages this API to execute token swaps with optimal pricing and minimal slippage, serving as the core trading engine for buy and sell operations.

### Key Features

* Optimal swap routing across multiple DEXes
* Real-time price quoting
* Slippage control
* Platform fee support
* Priority fee management for faster transactions
* Automatic SOL wrapping/unwrapping

### API Endpoints

#### Quote Endpoint

```
GET https://{quicknode_url}/{api_key}/quote
```

**Parameters:**

* `inputMint`: Input token mint address
* `outputMint`: Output token mint address
* `amount`: Amount to swap in base units (e.g., lamports)
* `slippageBps`: Slippage tolerance in basis points
* `swapMode`: "ExactIn" or "ExactOut"
* `platformFeeBps`: Optional platform fee in basis points

**Response:**

```json
{
  "inAmount": "1000000000",
  "outAmount": "12345678",
  "priceImpactPct": "0.125",
  "marketInfos": [/* routing information */]
}
```

#### Swap Endpoint

```
POST https://{quicknode_url}/{api_key}/swap
```

**Parameters:**

```json
{
  "quoteResponse": {/* Quote response object */},
  "userPublicKey": "user_wallet_public_key",
  "wrapAndUnwrapSol": true,
  "feeAccount": "platform_fee_wallet",
  "prioritizationFeeLamports": {/* Optional priority fee */}
}
```

**Response:**

```json
{
  "swapTransaction": "base64_encoded_transaction"
}
```

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

### Implementation in Strike Bot

The QuickNode Jupiter Swap API is primarily used through the `JupiterSwapService` class in `src/bot/services/jupiterSwap.service.ts`.

#### Key Methods

```typescript
// Get a swap quote
async getSwapQuote(
  inputMint: PublicKey | string,
  outputMint: PublicKey | string,
  amount: number | bigint,
  slippageBps: number = 100
): Promise<QuoteResponse | null>

// Execute a swap transaction
async swap(
  inputMint: PublicKey | string,
  outputMint: PublicKey | string,
  amount: number | bigint,
  slippageBps = 100,
  priorityFeeInSol = 0
): Promise<{ signature: string, outputAmount: number, decimals: number }>
```

### Example Usage

```typescript
// Initialize service
const jupiterService = new JupiterSwapService(
  env.QUIKNODE_RPC_URL,
  `${env.QUICKNOTE_JUPITER_SWAP_API}${env.QUICKNODE_API_KEY}`,
  keypair
)

// Buy a token with SOL
const result = await jupiterService.swap(
  SOL_MINT,
  tokenMint,
  1000000000, // 1 SOL in lamports
  200, // 2% slippage
  0.0005 // 0.0005 SOL priority fee
)

console.log(`Transaction signature: ${result.signature}`)
console.log(`Received ${result.outputAmount / (10 ** result.decimals)} tokens`)
```

### Best Practices

1. Always handle API errors with appropriate fallback mechanisms
2. Use reasonable slippage values based on token liquidity
3. Implement transaction confirmation tracking
4. Set appropriate priority fees during network congestion
5. Cache token decimal information to reduce RPC calls
