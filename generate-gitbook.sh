#!/bin/bash

# Create directories and files
mkdir -p introduction getting-started architecture core-components/features core-components/conversations core-components/services core-components/middlewares server/routes server/controllers configuration deployment testing advanced-topics troubleshooting api-reference contributing

# Create individual files
touch introduction/project-overview.md introduction/key-features.md introduction/technical-stack.md
touch getting-started/prerequisites.md getting-started/installation.md getting-started/configuration.md getting-started/quick-start.md
touch architecture/system-design.md architecture/data-flow.md architecture/database-schema.md architecture/queue-system.md
touch core-components/core-components.md
touch core-components/features/index.md core-components/features/start-feature.md core-components/features/trade-feature.md core-components/features/buy-token-feature.md core-components/features/sell-token-feature.md core-components/features/limit-order-feature.md core-components/features/positions-feature.md core-components/features/settings-feature.md core-components/features/withdraw-feature.md core-components/features/referral-feature.md
touch core-components/conversations/index.md core-components/conversations/buy-sell-settings.md core-components/conversations/token-address.md core-components/conversations/custom-amounts.md core-components/conversations/slippage-settings.md core-components/conversations/limit-orders.md
touch core-components/services/index.md core-components/services/price-service.md core-components/services/wallet-service.md core-components/services/commission-service.md core-components/services/execute-swap-service.md core-components/services/hidden-tokens-service.md core-components/services/settings-service.md
touch core-components/middlewares/index.md core-components/middlewares/settings-middleware.md core-components/middlewares/update-logger.md
touch server/server-implementation.md server/api-routes.md
touch server/routes/user-routes.md server/routes/transaction-routes.md server/routes/weekly-winner-routes.md server/routes/constants-routes.md server/routes/referral-routes.md
touch server/controllers/index.md server/controllers/user-controllers.md server/controllers/transaction-controllers.md server/controllers/weekly-winner-controllers.md
touch configuration/index.md configuration/environment-variables.md configuration/bot-configuration.md configuration/database-configuration.md configuration/redis-configuration.md configuration/queue-configuration.md
touch deployment/index.md deployment/docker.md deployment/pm2.md deployment/production-setup.md deployment/monitoring.md
touch testing/index.md testing/unit-tests.md testing/integration-tests.md testing/e2e-tests.md
touch advanced-topics/index.md advanced-topics/limit-order-system.md advanced-topics/prize-pool-system.md advanced-topics/referral-system.md advanced-topics/transaction-management.md
touch troubleshooting/index.md troubleshooting/common-issues.md troubleshooting/error-handling.md troubleshooting/debugging-guide.md
touch api-reference/index.md api-reference/internal-apis.md api-reference/external-apis.md api-reference/websocket-apis.md
touch contributing/index.md contributing/development-setup.md contributing/coding-standards.md contributing/pull-request-process.md
touch changelog.md

# Create SUMMARY.md
cat <<EOL > SUMMARY.md
# Table of Contents

* [Introduction](introduction/project-overview.md)
    * [Project Overview](introduction/project-overview.md)
    * [Key Features](introduction/key-features.md)
    * [Technical Stack](introduction/technical-stack.md)
* [Getting Started](getting-started/prerequisites.md)
    * [Prerequisites](getting-started/prerequisites.md)
    * [Installation](getting-started/installation.md)
    * [Configuration](getting-started/configuration.md)
    * [Quick Start Guide](getting-started/quick-start.md)
* [Architecture](architecture/system-design.md)
    * [System Design](architecture/system-design.md)
    * [Data Flow](architecture/data-flow.md)
    * [Database Schema](architecture/database-schema.md)
    * [Queue System](architecture/queue-system.md)
* [Core Components](core-components/core-components.md)
    * [Bot Features](core-components/features/index.md)
        * [Start Feature](core-components/features/start-feature.md)
        * [Trade Feature](core-components/features/trade-feature.md)
        * [Buy Token Feature](core-components/features/buy-token-feature.md)
        * [Sell Token Feature](core-components/features/sell-token-feature.md)
        * [Limit Order Feature](core-components/features/limit-order-feature.md)
        * [Positions Feature](core-components/features/positions-feature.md)
        * [Settings Feature](core-components/features/settings-feature.md)
        * [Withdraw Feature](core-components/features/withdraw-feature.md)
        * [Referral System](core-components/features/referral-feature.md)
    * [Conversations](core-components/conversations/index W.md)
        * [Buy/Sell Settings](core-components/conversations/buy-sell-settings.md)
        * [Token Address](core-components/conversations/token-address.md)
        * [Custom Amounts](core-components/conversations/custom-amounts.md)
        * [Slippage Settings](core-components/conversations/slippage-settings.md)
        * [Limit Orders](core-components/conversations/limit-orders.md)
    * [Services](core-components/services/index.md)
        * [Price Service](core-components/services/price-service.md)
        * [Wallet Service](core-components/services/wallet-service.md)
        * [Commission Service](core-components/services/commission-service.md)
        * [Execute Swap Service](core-components/services/execute-swap-service.md)
        * [Hidden Tokens Service](core-components/services/hidden-tokens-service.md)
        * [Settings Service](core-components/services/settings-service.md)
    * [Middlewares](core-components/middlewares/index.md)
        * [Settings Middleware](core-components/middlewares/settings-middleware.md)
        * [Update Logger](core-components/middlewares/update-logger.md)
* [Server Implementation](server/server-implementation.md)
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
* [Configuration](configuration/index.md)
    * [Environment Variables](configuration/environment-variables.md)
    * [Bot Configuration](configuration/bot-configuration.md)
    * [Database Configuration](configuration/database-configuration.md)
    * [Redis Configuration](configuration/redis-configuration.md)
    * [Queue Configuration](configuration/queue-configuration.md)
* [Deployment](deployment/index.md)
    * [Docker Deployment](deployment/docker.md)
    * [PM2 Deployment](deployment/pm2.md)
    * [Production Setup](deployment/production-setup.md)
    * [Monitoring](deployment/monitoring.md)
* [Testing](testing/index.md)
    * [Unit Tests](testing/unit-tests.md)
    * [Integration Tests](testing/integration-tests.md)
    * [End-to-End Tests](testing/e2e-tests.md)
* [Advanced Topics](advanced-topics/index.md)
    * [Limit Order System](advanced-topics/limit-order-system.md)
    * [Prize Pool System](advanced-topics/prize-pool-system.md)
    * [Referral System](advanced-topics/referral-system.md)
    * [Transaction Management](advanced-topics/transaction-management.md)
* [Troubleshooting](troubleshooting/index.md)
    * [Common Issues](troubleshooting/common-issues.md)
    * [Error Handling](troubleshooting/error-handling.md)
    * [Debugging Guide](troubleshooting/debugging-guide.md)
* [API Reference](api-reference/index.md)
    * [Internal APIs](api-reference/internal-apis.md)
    * [External APIs](api-reference/external-apis.md)
    * [WebSocket APIs](api-reference/websocket-apis.md)
* [Contributing](contributing/index.md)
    * [Development Setup](contributing/development-setup.md)
    * [Coding Standards](contributing/coding-standards.md)
    * [Pull Request Process](contributing/pull-request-process.md)
* [Changelog](changelog.md)
EOL

echo "GitBook structure generated successfully!"
