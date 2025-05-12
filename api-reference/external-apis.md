# External APIs

These APIs are used for integrating with external services and third-party systems.

### Price APIs

#### DexScreener Price Service

```http
GET /api/prices/token
```

Fetches token prices from DexScreener API with fallback to Jupiter.

**Query Parameters:**

* `tokenAddress`: Solana token address
* `network`: Network identifier (default: "mainnet")

**Response:**

```json
{
  "price": "1.23",
  "priceUsd": "1.23",
  "timestamp": "2025-05-12T10:30:00Z",
  "source": "DexScreener"
}
```

#### Jupiter Swap API Integration

**Get Swap Quote**

```http
GET /api/swap/quote
```

Fetches swap quotes from Jupiter API.

**Query Parameters:**

* `inputMint`: Input token mint address
* `outputMint`: Output token mint address
* `amount`: Amount to swap
* `slippageBps`: Slippage tolerance in basis points (default: 100)

**Response:**

```json
{
  "inAmount": "1000000",
  "outAmount": "2000000",
  "priceImpactPct": "0.1",
  "routePlan": [...],
  "slippageBps": 100
}
```

### Solana Integration APIs

#### Get SOL Balance

```http
GET /api/solana/balance/{walletAddress}
```

Fetches SOL balance for a wallet address.

**Response:**

```json
{
  "balance": "1.234",
  "balanceInLamports": "1234000000"
}
```

#### Get Token Holdings

```http
GET /api/solana/tokens/{walletAddress}
```

Retrieves token holdings for a wallet address.

**Response:**

```json
{
  "tokens": [
    {
      "mint": "SOL...",
      "balance": "1.234",
      "decimals": 9,
      "symbol": "SOL"
    }
  ]
}
```

### Transaction Confirmation Service

#### Verify Transaction

```http
POST /api/transaction-confirmation/verify
```

Verifies a Solana transaction.

**Request Body:**

```json
{
  "signature": "transaction_signature",
  "expectedAmount": "1.23"
}
```

**Response:**

```json
{
  "verified": true,
  "status": "confirmed",
  "confirmations": 32
}
```

#### Get Transaction Details

```http
GET /api/transaction-confirmation/details/{signature}
```

Fetches detailed information about a transaction.

**Response:**

```json
{
  "signature": "transaction_signature",
  "slot": 12345,
  "confirmations": 32,
  "timestamp": "2025-05-12T10:30:00Z",
  "status": "confirmed"
}
```

### Rate Limits

External APIs are subject to rate limiting:

* Standard tier: 60 requests per minute
* Premium tier: 300 requests per minute

### Error Handling

External APIs use standard HTTP status codes and return detailed error messages:

```json
{
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Too many requests",
    "details": {
      "retryAfter": 60
    }
  }
}
```

Common Error Codes:

* `RATE_LIMIT_EXCEEDED`: Request limit reached
* `INVALID_PARAMETERS`: Invalid input parameters
* `SERVICE_UNAVAILABLE`: External service unavailable
* `NETWORK_ERROR`: Network-related issues

### Authentication

External APIs require API key authentication:

```http
Authorization: Bearer YOUR_API_KEY
```

Contact support to obtain API credentials for external service access.
