# Controllers

This documentation covers the various controllers used in the Strike Bot API. Controllers handle the business logic and request/response flow for different API endpoints.

### Controller Categories

1. User Controllers
   * Handle user management, statistics, and user-related operations
   * Includes user blocking, statistics, and activity tracking
2. Transaction Controllers
   * Process and manage transaction-related operations
   * Handle transaction verification and confirmation
   * Generate transaction statistics and reports
3. Weekly Winner Controllers
   * Manage weekly competition winners
   * Handle prize distribution and winner approval
   * Track weekly statistics and leaderboards

### Common Response Format

All controllers follow a standard response format:

```typescript
{
  success: boolean,
  data?: any,
  error?: string,
  statusCode: number
}
```

### Error Handling

Controllers implement consistent error handling:

* Input validation errors return 400 Bad Request
* Authentication errors return 401 Unauthorized
* Resource not found returns 404 Not Found
* Server errors return 500 Internal Server Error

### Request Validation

All controllers implement request validation:

* Query parameters validation
* Request body validation where applicable
* Type checking and data sanitization
