# External APIs

The Strike Bot integrates with several external APIs to provide its functionality. This document details the external APIs used by the system.

## Solana Network APIs

### Web3.js RPC

* **Purpose**: Interact with the Solana blockchain
* **Endpoints**: Configurable via `SOLANA_RPC_URL` environment variable
* **Documentation**: [Solana Web3.js Documentation](https://solana-labs.github.io/solana-web3.js/)

### Jupiter Aggregator

* **Purpose**: Execute token swaps with best rates
* **Base URL**: https://quote-api.jup.ag/v6
* **Documentation**: [Jupiter API Documentation](https://station.jup.ag/docs/apis/overview)

### DexScreener Price API

* **Purpose**: Get real-time token prices
* **Base URL**: https://api.dexscreener.com/v1
* **Documentation**: [DexScreener API Documentation](https://docs.dexscreener.com/api/reference)

## Authentication Service APIs

The application uses JWT-based authentication. All external service calls require proper authentication headers.

### Request Format

```http
GET /api/endpoint
Authorization: Bearer <jwt-token>
```

### Response Format

All API responses follow a standard format:

```json
{
  "success": true,
  "data": {},
  "error": null
}
```

##
