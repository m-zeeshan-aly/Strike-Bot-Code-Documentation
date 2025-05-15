# Quick Start Guide

This guide provides a quick overview of how to launch the Strike Bot, use basic commands, perform trading operations, manage wallets, and monitor the bot's status.

### Launch the Bot

#### 1. Start in Development Mode

To start the bot in development mode, use the following command:

```bash
pnpm dev
```

### Basic Commands

Interact with the bot using the following basic commands:

* **Start the bot interaction**: `/start`
* **Access settings**: `/settings`
* **View help**: `/help`

### Trading Operations

Perform trading operations with the bot using these commands:

* **Buy Tokens**: `/buy`
* **Sell Tokens**: `/sell`
* **Set Limit Orders**: `/limitorders`
* **View Positions**: `/positions`

### Wallet Management

Manage your wallet with the following commands:

* **Withdraw Funds**: `/withdraw`
* **View Balance**: Navigate to the main menu using `/start` and select the balance option.

### Development Commands

Use these commands for development and maintenance:

* **Run Type Checking**: `pnpm typecheck`
* **Run Linting**: `pnpm lint`
* **Format Code**: `pnpm format`

### Monitoring

Monitor the bot's status and logs with these commands:

* **Check Server Status**: `curl http://localhost:3000/`
* **Monitor Logs**: `pnpm pm2 logs`

### Common Operations

Perform common operations to maintain and troubleshoot the bot:

* **Reset Bot**:
  * Clear Redis Session: `redis-cli FLUSHALL`
* **Handle Transactions**:
  * Create Transaction: `/buy <token_address>`
  * Monitor Transaction: Check transaction status in the user interface.
  * View Transaction History: Available in the main menu.
