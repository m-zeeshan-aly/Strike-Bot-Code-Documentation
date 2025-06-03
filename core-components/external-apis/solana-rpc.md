# Solana RPC

### Overview

The Solana RPC API is the primary interface for interacting with the Solana blockchain. Strike Bot uses this API for wallet management, transaction signing and submission, account data queries, and token operations.

### Key Features

* Wallet balance queries
* Transaction building and submission
* SPL token management
* Account creation and management
* Token metadata retrieval
* Transaction confirmation tracking

### API Endpoint Structure

Solana RPC uses a single HTTP endpoint with JSON-RPC protocol. All API methods use the same endpoint URL but with different method names in the request body:

```
POST https://{solana_rpc_url}
```

### Common Methods

#### Get Account Info

**Request:**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "getAccountInfo",
  "params": [
    "wallet_address",
    {
      "encoding": "jsonParsed",
      "commitment": "confirmed"
    }
  ]
}
```

#### Get Token Accounts

**Request:**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "getTokenAccountsByOwner",
  "params": [
    "wallet_address",
    {
      "programId": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA"
    },
    {
      "encoding": "jsonParsed"
    }
  ]
}
```

#### Send Transaction

**Request:**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "sendTransaction",
  "params": [
    "serialized_transaction",
    {
      "skipPreflight": true,
      "preflightCommitment": "confirmed"
    }
  ]
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

The "Build" plan supports a moderate number of users, suitable for small to medium-scale projects. Based on the 50 requests/second limit, it can handle approximately **180,000 requests per hour** (50 requests/second × 3600 seconds). Assuming an average user makes 10 requests per hour (e.g., account info, balance checks, and transactions), this plan can support around **18,000 users per hour** at peak load. However, this is a rough estimate and depends on usage patterns, such as the frequency of RPC calls.

If you need to support more users or increase capacity (e.g., for higher request rates or larger data needs), you can upgrade to a higher QuickNode plan. Visit the [QuickNode pricing page](https://www.quicknode.com/pricing) to explore other plans with increased API credits, request limits, and storage options. For custom scaling needs, you can also contact QuickNode support for enterprise solutions.

### Implementation in Strike Bot

The Solana RPC API is used throughout the codebase, primarily in:

1. `src/bot/helpers/utils/solana.utils.ts` - Core utilities for blockchain interactions
2. `src/bot/helpers/walletService.helper.ts` - Wallet management functions
3. `src/bot/services/transaction.service.ts` - Transaction building and submission

#### Key Methods

```typescript
// Create connection to Solana RPC
export function createSolanaConnection(): Connection {
  return new Connection(env.QUIKNODE_RPC_URL, {
    commitment: 'confirmed',
    confirmTransactionInitialTimeout: 60000
  })
}

// Get SOL balance for a wallet
export async function getSolBalance(
  walletAddress: string,
  connection?: Connection
): Promise<number> {
  const conn = connection || createSolanaConnection()
  const lamports = await conn.getBalance(new PublicKey(walletAddress))
  return lamports / LAMPORTS_PER_SOL
}

// Get token holdings for a wallet
export async function getWalletTokenHoldings(
  walletAddress: string,
  connection?: Connection
): Promise<WalletHoldings> {
  // Implementation details...
}
```

### Example Usage

```typescript
// Create a connection
const connection = createSolanaConnection()

// Check wallet balance
const balance = await getSolBalance(walletAddress, connection)
console.log(`Wallet balance: ${balance} SOL`)

// Get all token holdings
const holdings = await getWalletTokenHoldings(walletAddress, connection)
console.log(`This wallet holds ${holdings.tokens.length} different tokens`)

// Send a transaction
const txSignature = await connection.sendRawTransaction(
  transaction.serialize(),
  {
    skipPreflight: true,
    maxRetries: 3,
    preflightCommitment: 'confirmed'
  }
)
```

### Best Practices

1. Use connection pooling when possible
2. Implement retry logic for all RPC calls
3. Set appropriate commitment levels based on use case
4. Handle RPC errors gracefully with fallback to alternate endpoints
5. Cache frequently accessed account data
6. Use batch requests for multiple account queries
