# External APIS

## External APIs Overview

Strike Bot integrates with several external APIs to provide its core functionality. This directory contains documentation for each of these APIs, detailing their endpoints, parameters, and usage within the application.

### API Documentation Index

1. QuickNode Jupiter Swap API - DEX aggregator for token swaps with optimal pricing
2. Solana RPC API - Core interaction with the Solana blockchain
3. DexScreener API - Token price data and DEX pair information
4. GeckoTerminal API - Token discovery and metadata
5. Jupiter Price API - Fast and reliable token pricing
6. Metaplex API - NFT and token metadata handling

### Integration Pattern

Strike Bot follows a layered approach to API integration:

1. **Service Layer**: Each API has a dedicated service class that handles all interactions
2. **Circuit Breaker Pattern**: APIs include fallback mechanisms to handle outages
3. **Caching**: Responses are cached to reduce API calls and improve performance
4. **Rate Limiting**: All external API calls respect rate limits to prevent throttling

### Environment Configuration

API endpoints and keys are configured through environment variables defined in `environment.config.ts`.
