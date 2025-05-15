# Buy

Purchase any SPL token directly through Strike Bot with a simple command. This guide explains how to buy tokens on Solana using SOL.How to Buy TokensStep 1: Initiate PurchaseSend /buy command to Strike BotThe bot will present token optionsStep 2: Select TokenChoose from available tokens (BONK, USDC, etc.)Or type a specific token name or address

**Step 3: Enter Amount**

*
* Specify how much SOL you want to spend
*
* Minimum purchase: 0.01 SOL

**Step 4: Review & Confirm**

*

Check the transaction summary:

*
* SOL amount being spent
*
* Estimated tokens you'll receive
*
* Network fee
*
*
  * Total cost
*
* Select `Confirm` to execute or `Cancel` to abort

**Step 5: Transaction Completion**

*
* Bot executes the swap on-chain via Solana DEXs
*
* You'll receive a confirmation with transaction hash
*
* Link to Solscan for verification is provided

***

#### **Example Transaction** <a href="#example-transaction" id="example-transaction"></a>

You: /buyBot: Enter token address, symbol or name to buy:\[BONK] \[USDC] \[DUST] \[Other]You: BONKBot: Enter SOL amount to spend:You: 0.5Bot: Transaction Summary:- Spending: 0.5 SOL- Receiving: \~10,500,000 BONK- Network Fee: 0.0005 SOL- Trading Fee: 0.005 SOL (1%)\[Confirm] \[Cancel]You: ConfirmBot: Transaction Complete! ✅- Received: 10,482,503 BONK- TX: https://solscan.io/tx/3xKm...7fN9

***

#### **Advanced Buy Options** <a href="#advanced-buy-options" id="advanced-buy-options"></a>

**Custom Slippage**

*
* Set your preferred slippage tolerance
*
* Default: 1% (recommended for most trades)
*
* Higher slippage may be needed for low liquidity tokens

**Priority Gas**

*
* Increase transaction speed during congestion
*
* Enable in settings for faster execution

***

#### **Trading Tips** <a href="#trading-tips" id="trading-tips"></a>

*
* **Check Price First**: Use `/price [token]` to see current rates
*
* **Market Timing**: SOL/SPL prices fluctuate rapidly
*
* **Gas Optimization**: Trading during off-peak hours may reduce fees

***

#### **FAQ** <a href="#faq" id="faq"></a>

❓ **What's the minimum purchase amount?** → 0.01 SOL❓ **How are fees calculated?** → 1% trading fee (0.1% to prize pool, 0.9% to Strike) + Solana network fee❓ **Can I buy any SPL token?** → Yes, any token with sufficient liquidity on Solana DEXs
