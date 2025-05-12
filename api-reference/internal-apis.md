# Internal APIs

These APIs are used internally within the Strike Bot system for managing users, transactions, referrals, and other core functionalities.

### Base URL

```
http://localhost:3000/api
```

### Authentication

Internal APIs use system-level authentication and are not publicly accessible.

### User Management APIs

#### Get All Users

```http
GET /users/get-all-users
```

Fetches paginated list of users with filtering options.

**Query Parameters:**

* `page` (optional): Page number (default: 1)
* `limit` (optional): Items per page (default: 10)
* `telegramId` (optional): Filter by Telegram ID
* `isBlocked` (optional): Filter by blocked status
* `createdAtStart` (optional): Filter by creation date start
* `createdAtEnd` (optional): Filter by creation date end

**Response:**

```json
{
  "users": [
    {
      "telegramId": 123456789,
      "username": "john_doe",
      "isBlocked": false,
      "commissionId": null,
      "referralId": null,
      "walletId": null,
      "createdAt": "2025-04-24T17:03:42.686Z"
    }
  ],
  "totalUsers": 100,
  "page": 1,
  "limit": 10
}
```

#### Block/Unblock User

```http
POST /users/block-or-unblock-user
```

Blocks or unblocks a user from the system.

**Request Body:**

```json
{
  "telegramId": 123456789,
  "action": "block" // or "unblock"
}
```

### Transaction APIs

#### Get All Transactions

```http
GET /transactions/all-transactions
```

Retrieves all transactions with pagination and filtering.

**Query Parameters:**

* `page`: Page number
* `limit`: Items per page
* `sortField`: Field to sort by
* `sortOrder`: Sort direction ('asc' or 'desc')

#### Transaction Statistics

```http
GET /transactions/count-comparison
GET /transactions/amount-comparison
GET /transactions/transaction-count-with-volume
```

Various endpoints for transaction analytics and statistics.

### Referral System APIs

#### Get All Referrals

```http
GET /referrals/get-all-referrals
```

Fetches all referrals with filters and pagination.

**Query Parameters:**

* `page`: Page number
* `limit`: Items per page
* `telegramId`: Filter by referrer's Telegram ID
* `referralBlocked`: Filter by blocked status

#### Update Referral Commission

```http
POST /referrals/update-referral-commission
```

Updates custom commission rate for a referral.

**Request Body:**

```json
{
  "telegramId": 123456789,
  "customCommissionRate": 0.5
}
```

### Weekly Winner APIs

#### Create Weekly Winners

```http
POST /weekly-winners/create-current-week-winners
```

Creates winners for the current week competition.

#### Get Weekly Winners

```http
GET /weekly-winners/get-all-weekly-winners
```

Retrieves all weekly winners with pagination.

#### Approve Weekly Winners

```http
POST /weekly-winners/approve-weekly-winners
```

Approves and processes rewards for weekly winners.

### Constants Management

#### Update Winner Percentages

```http
POST /constants/update-winner-percentages
```

Updates prize distribution percentages for winners.

#### Update Commission

```http
POST /constants/update-commission
```

Updates platform commission rates.

### Error Responses

All APIs follow a standard error response format:

```json
{
  "error": "Error message description",
  "statusCode": 400
}
```

Common Status Codes:

* 200: Success
* 400: Bad Request
* 401: Unauthorized
* 404: Resource Not Found
* 500: Internal Server Error
