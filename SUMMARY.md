# Table of contents

## Introduction

* [Project Overview](README.md)
* [Key Features](introduction/key-features.md)
* [Technical Stack](<README (1).md>)

## Getting Started

* [Quick Start Guide](getting-started/quick-start.md)
* [Prerequisites](getting-started/installation.md)
* [Installation](getting-started/installation-1.md)
* [Configuration](getting-started/index/README.md)
  * [Environment Variables](getting-started/index/environment-variables.md)
  * [Bot Configuration](getting-started/index/bot-configuration.md)
  * [Database Configuration](getting-started/index/database-configuration.md)
  * [Redis Configuration](getting-started/index/redis-configuration.md)
  * [Queue Configuration](getting-started/index/queue-configuration.md)

## Deployment

* [Docker Deployment](deployment/docker.md)
* [Production Setup](deployment/production-setup.md)

## Core Components

* [Conversations](core-components/conversations/README.md)
  * [Buy/Sell Settings](core-components/conversations/buy-sell-settings.md)
  * [Token Address](core-components/conversations/token-address.md)
  * [Custom Amounts](core-components/conversations/custom-amounts.md)
* [Services](core-components/index/README.md)
  * [Price Service](core-components/index/price-service.md)
  * [Wallet Service](core-components/index/wallet-service.md)
  * [Commission Service](core-components/index/commission-service.md)
  * [Execute Swap Service](core-components/index/execute-swap-service.md)
  * [Hidden Tokens Service](core-components/index/hidden-tokens-service.md)
  * [Settings Service](core-components/index/settings-service.md)
* [Middlewares](core-components/index-1/README.md)
  * [Settings Middleware](core-components/index-1/settings-middleware.md)

## Architecture

* [Database Schema](architecture/database-schema.md)
* [Queue System](architecture/queue-system.md)
* [System Design](architecture/system-design.md)

## Server Implementation

* [API Routes](server/api-routes.md)
  * [User Routes](server/routes/user-routes.md)
  * [Transaction Routes](server/routes/transaction-routes.md)
  * [Weekly Winner Routes](server/routes/weekly-winner-routes.md)
  * [Constants Routes](server/routes/constants-routes.md)
  * [Referral Routes](server/routes/referral-routes.md)
* [Controllers](server/controllers/index.md)
  * [User Controllers](server/controllers/user-controllers.md)
  * [Transaction Controllers](server/controllers/transaction-controllers.md)
  * [Weekly Winner Controllers](server/controllers/weekly-winner-controllers.md)
