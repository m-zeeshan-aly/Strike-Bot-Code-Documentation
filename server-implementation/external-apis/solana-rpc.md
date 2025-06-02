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

### Common Endpoints

#### Get Account Info

```
POST https://{solana_rpc_url}
```

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

```
POST https://{solana_rpc_url}
```

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

```
POST https://{solana_rpc_url}
```

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
