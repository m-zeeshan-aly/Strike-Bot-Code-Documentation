# Sell

Convert your SPL tokens back to SOL instantly through Strike Bot. This guide explains how to sell tokens on Solana quickly and efficiently.How to Sell TokensStep 1: Initiate SaleSend /sell command to Strike BotThe bot will present token optionsStep 2: Select TokenChoose from tokens in your wallet (BONK, USDC, etc.)Step 3: Enter Amount

*
* Specify how many tokens you want to sell
*
* Or select a percentage (25%, 50%, 100%)
*
* Minimum value: equivalent to 0.01 SOL

**Step 4: Review & Confirm**

*

Check the transaction summary:

*
* Token amount being sold
*
* Estimated SOL you'll receive
*
* Network fee
*
*
  * Total you'll receive
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

You: /sellBot: Select token to sell:\[BONK] \[USDC] \[DUST] \[Other]You: BONKBot: Enter amount to sell:\[25%] \[50%] \[100%] \[Custom]You: 10000000Bot: Transaction Summary:- Selling: 10,000,000 BONK- Receiving: \~0.48 SOL- Network Fee: 0.0005 SOL- Trading Fee: 0.0048 SOL (1%)\[Confirm] \[Cancel]You: ConfirmBot: Transaction Complete! ✅- Received: 0.4747 SOL- TX: https://solscan.io/tx/5x8J...9zL2

***

#### **Advanced Sell Options** <a href="#advanced-sell-options" id="advanced-sell-options"></a>

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
* **Partial Sells**: Consider selling in portions during volatility
*
* **Tax Tracking**: Save transaction links for your records

***

#### **FAQ** <a href="#faq" id="faq"></a>

❓ **What's the minimum sell amount?** → Value equivalent to 0.01 SOL❓ **How are fees calculated?** → 1% trading fee (0.1% to prize pool, 0.9% to Strike) + Solana network fee❓ **Can I sell to USDC instead of SOL?** → Currently all sells convert to SOL. Use `/buy USDC` with your SOL afterwards.
