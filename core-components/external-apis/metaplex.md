# Metaplex

### Overview

The Metaplex API provides access to token metadata and NFT information on the Solana blockchain. Strike Bot utilizes this API to fetch token metadata including names, symbols, decimals, and images, enhancing the user experience with accurate token information.

### Key Features

* Token metadata retrieval
* NFT data access
* On-chain metadata program integration
* Token image and URI handling
* Metadata account discovery

### Metadata Program

Metaplex manages token metadata through the Metadata Program, which has a fixed program ID:

```
metaqbxxUerdq28cj1RbAWkYQm3ybzjb6a8bt518x1s
```

This program stores metadata for tokens in predictable account addresses (PDAs) derived from the token mint.

### Metadata Structure

Token metadata is stored on-chain and typically includes:

* Name: Token name
* Symbol: Token ticker symbol
* URI: Link to off-chain metadata (usually JSON)
* Creators: List of creator addresses
* Collection: Optional collection the token belongs to
* Uses: Token usage information

### QuickNode Plan Details (for Solana RPC Access)

The Metaplex API is free to use as it interacts directly with on-chain data on the Solana blockchain. However, it requires Solana RPC calls to fetch this data. In this project, these RPC calls are made through the QuickNode "Build" plan, which costs $49/month and includes the following:

* **80 million API credits** per month (at a rate of 0.62 credits per 1 million API credits)
* **50 requests per second** limit
* **10 GB for streams**
* **500 GB/s for functions**
* **10 GB for IPFS**

#### User Capacity and Scaling

Since the Metaplex API relies on Solana RPC calls via QuickNode, the user capacity is determined by the QuickNode "Build" plan's limits. With a rate limit of 50 requests per second, it can handle approximately **180,000 requests per hour** (50 requests/second × 3600 seconds). Assuming an average user makes 5 requests per hour for metadata retrieval (e.g., fetching token names, symbols, or images), this plan can support around **36,000 users per hour** at peak load. This estimate varies based on usage patterns, such as the frequency of metadata queries.

If you need to support more users or increase capacity (e.g., for higher request rates), you can upgrade to a higher QuickNode plan. Visit the [QuickNode pricing page](https://www.quicknode.com/pricing) to explore other plans with increased API credits, request limits, and storage options. For custom scaling needs, you can also contact QuickNode support for enterprise solutions. Note that the Metaplex API itself remains free, but the RPC provider's limits will dictate scaling requirements.

### Implementation in Strike Bot

The Metaplex API is primarily used in `src/bot/helpers/utils/solana.utils.ts` to fetch token metadata.

#### Key Components

```typescript
// Metaplex Metadata Program ID
const METADATA_PROGRAM_ID = new PublicKey('metaqbxxUerdq28cj1RbAWkYQm3ybzjb6a8bt518x1s')

/**
 * Calculates the PDA for a token's metadata account
 */
function findMetadataAddress(mint: PublicKey): PublicKey {
  return PublicKey.findProgramAddressSync(
    [
      Buffer.from('metadata'),
      METADATA_PROGRAM_ID.toBuffer(),
      mint.toBuffer(),
    ],
    METADATA_PROGRAM_ID
  )[0]
}

/**
 * Fetches and decodes token metadata
 */
async function fetchBasicTokenMetadata(
  mintAddress: string,
  connection: Connection,
): Promise<{ name: string | null, symbol: string | null }> {
  try {
    // Find the metadata account PDA
    const metadataPDA = findMetadataAddress(new PublicKey(mintAddress))

    // Get the account data
    const accountInfo = await connection.getAccountInfo(metadataPDA)

    if (!accountInfo) {
      return { name: null, symbol: null }
    }

    // Decode the metadata
    return decodeMetadata(accountInfo.data)
  }
  catch (error) {
    console.warn(`Error fetching metadata for ${mintAddress}:`, error)
    return { name: null, symbol: null }
  }
}

/**
 * Decodes token metadata from buffer
 */
function decodeMetadata(buffer: Buffer): { name: string | null, symbol: string | null } {
  // Metadata parsing implementation...
}
```

### Example Usage

```typescript
// Fetch token metadata
async function getTokenDetails(mintAddress: string) {
  const connection = createSolanaConnection()
  const metadata = await fetchBasicTokenMetadata(mintAddress, connection)

  console.log(`Token Name: ${metadata.name || 'Unknown'}`)
  console.log(`Token Symbol: ${metadata.symbol || 'Unknown'}`)

  return metadata
}

// Get full token data including metadata
const tokenMetadata = await getTokenMetadata('EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v')
console.log(`${tokenMetadata.name} (${tokenMetadata.symbol})`)
console.log(`Decimals: ${tokenMetadata.decimals}`)
```

### Best Practices

1. Cache metadata results to reduce RPC calls
2. Implement error handling for tokens without metadata
3. Handle both on-chain and off-chain metadata appropriately
4. Include fallback token name/symbol handling
5. Consider batching metadata queries for multiple tokens
