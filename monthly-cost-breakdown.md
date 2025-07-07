# Monthly Cost Breakdown

![](https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png)

## Updated Monthly Cost Breakdown - Strike Bot Infrastructure

### Current Infrastructure Costs (July 2025)

#### Complete Service Breakdown

| **Service/Platform**     | **Plan/Tier**     | **Monthly Cost (USD)** | **Users/Accounts** | **Notes**                                   |
| ------------------------ | ----------------- | ---------------------- | ------------------ | ------------------------------------------- |
| **AWS EC2**              | Production & Test | $60                    | 1 account          | t3.small + t2.micro instances               |
| **QuickNode**            | Build Plan        | $49                    | 1 account          | Solana RPC & Jupiter API (50 RPS)           |
| **Metis Jupiter API**    | Launch Plan       | $249                   | 1 account          | Premium Jupiter Swap API (50 RPS)           |
| **CoinGecko**            | Analyst Plan      | $129                   | 1 account          | Token data & market info                    |
| **DexScreener API**      | Free Tier         | $0                     | 1 account          | 300 requests/minute limit                   |
| **Vercel**               | Pro Plan          | $40                    | 2 users            | bigosoft + kamron                           |
| **GitHub**               | Organization      | $0                     | Multiple           | strike-bot org (owner: kamronzy)            |
| **X Developer Platform** | Basic Package     | $200                   | 1 account          | Rate-limited v2 endpoints, 3,000 posts/user |
| **TwitterAPI.io**        | Pay-as-you-go     | $10                    | 1 account          | Pay per usage, tweets/profiles/followers    |

#### Total Monthly Infrastructure Cost

| **Category**             | **Amount (USD)** | **Percentage** |
| ------------------------ | ---------------- | -------------- |
| **Cloud Infrastructure** | $60              | 8.1%           |
| **API Services**         | $637             | 86.4%          |
| **Development Tools**    | $40              | 5.4%           |
| **Version Control**      | $0               | 0.0%           |
| **TOTAL**                | **$737**         | **100%**       |

### Cost Analysis & Breakdown

#### API Services ($637 - 86.4% of total)

**Social Media & Data APIs:**

* X Developer Platform Basic: $200/month
* TwitterAPI.io: $10/month (estimated usage)

**Blockchain & Trading APIs:**

* Metis Jupiter API Launch Plan: $249/month
* QuickNode Build Plan: $49/month
* CoinGecko Analyst Plan: $129/month
* DexScreener API: $0/month (free tier)

#### Cloud Infrastructure ($60 - 8.1% of total)

**AWS EC2 Services:**

* Production instance (t3.small): \~$40/month
* Test instance (t2.micro): \~$20/month

#### Development Tools ($40 - 5.4% of total)

**Hosting & Deployment:**

* Vercel Pro Plan: $40/month (2 users)

#### Version Control ($0 - 0% of total)

**Code Management:**

* GitHub Organization: Free

### Recent Changes & Impact

#### New Additions

* **X Developer Platform Basic**: +$200/month
* **TwitterAPI.io**: +$10/month

#### Cost Impact

* **Previous Total**: $527/month
* **Current Total**: $737/month
* **Increase**: $210/month (+39.8%)

### Service Utilization Summary

#### High-Value Services

1. **Metis Jupiter API** ($249) - Core trading functionality
2. **X Developer Platform** ($200) - Social media automation
3. **CoinGecko** ($129) - Market data and analytics

#### Supporting Services

* **AWS EC2** ($60) - Infrastructure hosting
* **QuickNode** ($49) - Blockchain connectivity
* **Vercel** ($40) - Frontend deployment
* **TwitterAPI.io** ($10) - Additional Twitter data access

#### Free Tier Services

* **GitHub** - Code repository management
* **DexScreener API** - DEX trading data (limited)

### Account Management

#### Primary Account Holders

* **AWS**: 1 account
* **X Developer Platform**: 1 account
* **TwitterAPI.io**: 1 account
* **Vercel**: 2 users (bigosoft + kamron)
* **GitHub**: Multiple users under strike-bot organization

#### Usage Monitoring

* **X Developer Platform**: 3,000 user posts, 50,000 app posts, 15,000 reads/month
* **TwitterAPI.io**: 1,000,000 credits ($10 budget)
* **QuickNode**: 50 RPS limit
* **Metis Jupiter API**: 50 RPS limit

### Recommendations

#### Cost Optimization

* Monitor TwitterAPI.io usage to ensure $10 budget is sufficient
* Consider annual subscription for X Developer Platform (save $25/month)
* Evaluate DexScreener API free tier limits vs. potential paid upgrade

#### Scaling Considerations

* AWS EC2 instances may need upgrading as user base grows
* API rate limits should be monitored for potential tier upgrades
* Consider bulk pricing negotiations for high-usage APIs

This updated breakdown reflects the addition of social media automation capabilities through X Developer Platform and TwitterAPI.io, representing a significant investment in data access and social engagement features for the Strike Bot project.
