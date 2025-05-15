# API Routes

The Strike Bot API is organized into several route groups to handle different aspects of the application. All routes are prefixed with `/api`.

### Base URL

```
http://localhost:3000/api
```

### Available Route Groups

1. **User Routes** (`/api/users`)
   * Handles user management, statistics, and user-related operations
   * Features: user listing, blocking/unblocking, top user statistics, and detailed user information

2. **Transaction Routes** (`/api/transactions`)
   * Manages transaction operations, statistics, and history
   * Features: transaction listing, monthly summaries, comparison statistics, and weekly analysis

3. **Weekly Winner Routes** (`/api/weekly-winners`)
   * Handles weekly competition winners and related operations
   * Features: creating winners, approving winners, and retrieving winner data

4. **Constants Routes** (`/api/constants`)
   * Manages system constants, commission rates, and prize pool settings
   * Features: updating winner percentages, commission rates, and retrieving prize pool data

5. **Referral Routes** (`/api/referrals`)
   * Handles referral system operations and commission management
   * Features: referral listing, filtering, and custom commission management

6. **Additional Route Groups**:
   * `/api/blocked-users` - Manages blocked user operations
   * `/api/transaction-confirmation` - Handles transaction verification and processing

### Authentication

All API routes (except health check) require authentication via a Bearer token in the Authorization header:

```
Authorization: Bearer YOUR_AUTH_TOKEN
```

### Health Check

```
GET /api/health
```

Returns a simple health check response to verify API is running.

**Response:**
```json
{
  "status": true,
  "message": "🚀 API is running!"
}
```

### Error Handling

All endpoints follow a consistent error response format:

```json
{
  "error": "Descriptive error message"
}
```

HTTP status codes are used appropriately to indicate the type of error:
- 400: Bad Request (invalid input)
- 401: Unauthorized (missing or invalid token)
- 404: Not Found (resource not found)
- 409: Conflict (e.g., resource already exists)
- 500: Internal Server Error
