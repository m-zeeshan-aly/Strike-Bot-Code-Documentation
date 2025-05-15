# User Routes

Base path: `/api/users`

### Available Endpoints

#### Get All Users

```http
GET /get-all-users
```

Fetches all users with pagination.

**Parameters:**
- `page` (number, optional): Page number for pagination (default: 1)
- `limit` (number, optional): Number of results per page (default: 10)
- `sortField` (string, optional): Field to sort by (default: 'createdAt')
- `sortOrder` (string, optional): Sort order ('asc' or 'desc', default: 'desc')
- `isBlocked` (boolean, optional): Filter for blocked/unblocked users
- `username` (string, optional): Filter by username (partial match)

**Response (200 OK):**
```json
{
  "users": [
    {
      "_id": "user_id",
      "telegramId": 123456789,
      "username": "john_doe",
      "firstName": "John",
      "lastName": "Doe",
      "isBlocked": false,
      "isActive": true,
      "lastActive": "2025-04-15T12:00:00Z",
      "totalTransactionCount": 25,
      "totalTransactionVolume": 1250.5,
      "createdAt": "2025-03-10T09:15:30Z"
    }
  ],
  "totalUsers": 150,
  "totalPages": 15,
  "currentPage": 1,
  "limit": 10
}
```

**Error Responses:**
- 400 Bad Request: If pagination parameters are invalid
- 500 Internal Server Error: If an unexpected error occurs

#### Top Users Endpoints

```http
GET /top-10-users
```

Retrieves the top 10 users with the highest transaction volume and total trades.

**Parameters:** None

**Response (200 OK):**
```json
{
  "users": [
    {
      "telegramId": 123456789,
      "username": "john_doe",
      "firstName": "John",
      "lastName": "Doe",
      "totalTransactionCount": 120,
      "totalTransactionVolume": 5250.75,
      "lastActive": "2025-04-15T12:00:00Z"
    }
  ]
}
```

```http
GET /top-10-users-previous-month
```

Fetches the top 10 users for the previous calendar month.

**Parameters:** None

**Response (200 OK):**
```json
{
  "users": [
    {
      "telegramId": 123456789,
      "username": "john_doe",
      "firstName": "John",
      "lastName": "Doe",
      "totalTransactionCount": 45,
      "totalTransactionVolume": 2100.25,
      "lastActive": "2025-03-28T18:30:00Z"
    }
  ],
  "month": "March 2025",
  "startDate": "2025-03-01T00:00:00Z",
  "endDate": "2025-03-31T23:59:59Z"
}
```

```http
GET /top-10-users-current-week
```

Retrieves top 10 users for the current week.

**Parameters:** None

**Response (200 OK):**
```json
{
  "users": [
    {
      "telegramId": 123456789,
      "username": "john_doe",
      "firstName": "John",
      "lastName": "Doe",
      "totalTransactionCount": 15,
      "totalTransactionVolume": 850.50,
      "lastActive": "2025-04-15T12:00:00Z"
    }
  ],
  "weekStartDate": "2025-04-13T00:00:00Z",
  "weekEndDate": "2025-04-19T23:59:59Z"
}
```

#### User Statistics

```http
GET /user-count-comparison
```

Fetches user count, percentage change, and total database count.

**Parameters:** None

**Response (200 OK):**
```json
{
  "currentPeriodCount": 350,
  "previousPeriodCount": 300,
  "percentageChange": 16.67,
  "totalCount": 350,
  "period": "monthly"
}
```

```http
GET /active-user-count-comparison
```

Retrieves active user count and percentage change.

**Parameters:** None

**Response (200 OK):**
```json
{
  "currentPeriodCount": 280,
  "previousPeriodCount": 250,
  "percentageChange": 12.0,
  "period": "monthly"
}
```

#### Active Users Analysis

```http
GET /active-users-30-days
```

Fetches list of active users in the last 30 days.

**Parameters:**
- `page` (number, optional): Page number for pagination (default: 1)
- `limit` (number, optional): Number of results per page (default: 10)

**Response (200 OK):**
```json
{
  "users": [
    {
      "telegramId": 123456789,
      "username": "john_doe",
      "firstName": "John",
      "lastName": "Doe",
      "lastActive": "2025-04-15T12:00:00Z",
      "totalTransactionCount": 25,
      "totalTransactionVolume": 1250.5
    }
  ],
  "totalActiveUsers": 280,
  "totalPages": 28,
  "currentPage": 1,
  "limit": 10,
  "startDate": "2025-03-16T00:00:00Z",
  "endDate": "2025-04-15T23:59:59Z"
}
```

```http
GET /active-users-count-30-days
```

Returns active user count for the last 30 days.

**Parameters:** None

**Response (200 OK):**
```json
{
  "activeUserCount": 280,
  "startDate": "2025-03-16T00:00:00Z",
  "endDate": "2025-04-15T23:59:59Z"
}
```

```http
GET /active-user-count-and-comparison
```

Provides active user count for last 30 days with comparison metrics.

**Parameters:** None

**Response (200 OK):**
```json
{
  "currentPeriodCount": 280,
  "previousPeriodCount": 250,
  "percentageChange": 12.0,
  "startDate": "2025-03-16T00:00:00Z",
  "endDate": "2025-04-15T23:59:59Z"
}
```

#### User Details

```http
GET /get-user-details-by-telegram-id
```

Fetches user details using their Telegram ID.

**Parameters:**
- `telegramId` (number, required): Telegram ID of the user

**Response (200 OK):**
```json
{
  "user": {
    "_id": "user_id",
    "telegramId": 123456789,
    "username": "john_doe",
    "firstName": "John",
    "lastName": "Doe",
    "isBlocked": false,
    "isActive": true,
    "lastActive": "2025-04-15T12:00:00Z",
    "totalTransactionCount": 25,
    "totalTransactionVolume": 1250.5,
    "createdAt": "2025-03-10T09:15:30Z",
    "wallet": {
      "address": "wallet_address",
      "createdAt": "2025-03-10T09:15:35Z"
    },
    "referralStats": {
      "code": "abc123",
      "directReferrals": 5,
      "indirectReferrals": 2,
      "totalRewards": 1.25
    }
  }
}
```

**Error Responses:**
- 400 Bad Request: If telegramId is invalid or missing
- 404 Not Found: If user with telegramId not found
- 500 Internal Server Error: If an unexpected error occurs

```http
GET /get-user-transactions-by-telegram-id
```

Retrieves user transactions by Telegram ID with pagination.

**Parameters:**
- `telegramId` (number, required): Telegram ID of the user
- `page` (number, optional): Page number for pagination (default: 1)
- `limit` (number, optional): Number of results per page (default: 10)
- `type` (string, optional): Filter by transaction type (e.g., 'buy', 'sell')
- `startDate` (string, optional): Filter by date range start (format: YYYY-MM-DD)
- `endDate` (string, optional): Filter by date range end (format: YYYY-MM-DD)
- `sortField` (string, optional): Field to sort by (default: 'createdAt')
- `sortOrder` (string, optional): Sort order ('asc' or 'desc', default: 'desc')

**Response (200 OK):**
```json
{
  "transactions": [
    {
      "_id": "transaction_id",
      "type": "buy",
      "amount": 0.5,
      "amountInToken": 100,
      "tokenSymbol": "SOL",
      "tokenAddress": "token_address",
      "valueUsd": 50,
      "transactionFee": 0.01,
      "signature": "transaction_signature",
      "status": "completed",
      "createdAt": "2025-04-15T12:00:00Z"
    }
  ],
  "totalTransactions": 25,
  "totalPages": 3,
  "currentPage": 1,
  "limit": 10
}
```

**Error Responses:**
- 400 Bad Request: If telegramId is invalid or missing
- 404 Not Found: If user with telegramId not found
- 500 Internal Server Error: If an unexpected error occurs

#### User Management

```http
POST /block-or-unblock-user
```

Blocks or unblocks a user from using the system.

**Request Body:**
```json
{
  "telegramId": 123456789,
  "isBlocked": true,
  "reason": "Suspicious activity detected"
}
```

**Parameters:**
- `telegramId` (number, required): Telegram ID of the user
- `isBlocked` (boolean, required): True to block, false to unblock
- `reason` (string, optional): Reason for blocking the user

**Response (200 OK):**
```json
{
  "success": true,
  "message": "User has been blocked successfully.",
  "user": {
    "telegramId": 123456789,
    "username": "john_doe",
    "isBlocked": true,
    "blockedReason": "Suspicious activity detected",
    "blockedAt": "2025-04-15T12:30:00Z"
  }
}
```

**Error Responses:**
- 400 Bad Request: If telegramId is invalid or missing
- 404 Not Found: If user with telegramId not found
- 500 Internal Server Error: If an unexpected error occurs
