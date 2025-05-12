# Wallet Service

The Wallet Service manages Solana wallet operations and transactions for the Strike Bot.

### Core Features

* Wallet creation and management
* Transaction signing and sending
* Balance tracking
* SOL and SPL token transfers
* Transaction confirmation monitoring

### Core Methods

```typescript
class WalletService {
  // Get wallet balance in SOL
  async getBalance(address: string): Promise<number>
  
  // Get token balance for an SPL token
  async getTokenBalance(
    walletAddress: string,
    tokenAddress: string
  ): Promise<number>

  // Transfer SOL
  async transferSOL(
    amount: number,
    toAddress: string,
    priorityFee?: number
  ): Promise<string>

  // Transfer SPL tokens
  async transferToken(
    tokenAddress: string,
    amount: number,
    toAddress: string,
    priorityFee?: number
  ): Promise<string>
}
```

### Usage Example

```typescript
const walletService = new WalletService();

// Get SOL balance
const balance = await walletService.getBalance(walletAddress);

// Transfer SOL with priority fee
const signature = await walletService.transferSOL(
  1.5, // Amount in SOL
  recipientAddress,
  0.00001 // Priority fee in SOL
);

// Get token balance
const usdcBalance = await walletService.getTokenBalance(
  walletAddress,
  USDC_TOKEN_ADDRESS
);
```

### Configuration

The wallet service supports:

* Custom RPC endpoints
* Priority fee adjustments
* Transaction retry policies
* Connection pooling
* Rate limiting
