# API Routes

The Strike Bot API is organized into several route groups to handle different aspects of the application. All routes are prefixed with `/api`.

### Base URL

```
http://localhost:3000/api
```

### Available Route Groups

1. User Routes
   * Handles user management, statistics, and user-related operations
2. Transaction Routes
   * Manages transaction operations, statistics, and history
3. Weekly Winner Routes
   * Handles weekly competition winners and related operations
4. Constants Routes
   * Manages system constants, commission rates, and prize pool settings
5. Referral Routes
   * Handles referral system operations and commission management
6. Additional Route Groups:
   * `/blocked-users` - Manages blocked user operations
   * `/transaction-confirmation` - Handles transaction verification and processing

### Health Check

```
GET /api/sample
```

Returns a simple health check response to verify API is running.
