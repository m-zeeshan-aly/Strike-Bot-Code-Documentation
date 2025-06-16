# Monthly Cost Breakdown

### Strike Bot Infrastructure Costs

| Service/Platform      | Plan/Tier         | Monthly Cost (USD) | Users/Accounts | Notes                             |
| --------------------- | ----------------- | ------------------ | -------------- | --------------------------------- |
| **AWS EC2**           | Production & Test | \~$60              | 1 account      | t3.small + t2.micro instances     |
| **QuickNode**         | Build Plan        | $49                | 1 account      | Solana RPC & Jupiter API (50 RPS) |
| **Metis Jupiter API** | Launch Plan       | $249               | 1 account      | Premium Jupiter Swap API (50 RPS) |
| **CoinGecko**         | Analyst Plan      | $129               | 1 account      | Token data & market info          |
| **DexScreener API**   | Free Tier         | $0                 | 1 account      | 300 requests/minute limit         |
| **Vercel**            | Pro Plan          | $40                | 2 users        | bigosoft + kamron                 |
| **GitHub**            | Organization      | $0                 | Multiple       | strike-bot org (owner: kamronzy)  |

***

### Total Monthly Infrastructure Cost

| Category                 | Amount (USD) |
| ------------------------ | ------------ |
| **Cloud Infrastructure** | $60          |
| **API Services**         | $427         |
| **Development Tools**    | $40          |
| **Version Control**      | $0           |
| **TOTAL**                | **$527**     |

***

### Cost Distribution

* **API Services**: 81% ($427)
* **Cloud Infrastructure**: 11% ($60)
* **Development Tools**: 8% ($40)
* **Version Control**: 0% ($0)

***

### Account Details

#### AWS

* **Account**: info@strikebot.xyz
* **Services**: EC2 instances, EBS storage, networking

#### Vercel

* **Plan**: Pro ($20/month per user)
* **Users**:
  * bigosoft
  * kamron

#### GitHub

* **Organization**: strike-bot
* **Owner**: kamronzy
* **Plan**: Free (Open source/private repositories)

#### API Services

* **QuickNode Build**: Basic Solana RPC and Jupiter API access
* **Metis Jupiter API**: Premium Jupiter Swap API with enhanced features
* **CoinGecko**: Comprehensive crypto market data
* **DexScreener**: Free token price feeds

***

_Last Updated: Current as of project analysis_
