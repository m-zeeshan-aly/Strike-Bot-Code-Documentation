# Transaction Routes

Base path: `/api/transactions`

### Available Endpoints

#### All Transactions

```http
GET /all-transactions
```

Fetches all transactions with pagination.

**Parameters:**
- `page` (number, optional): Page number for pagination (default: 1)
- `limit` (number, optional): Number of results per page (default: 10)
- `telegramId` (number, optional): Filter by user's Telegram ID
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
      "telegramId": 123456789,
      "username": "john_doe",
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
  "totalTransactions": 150,
  "totalPages": 15,
  "currentPage": 1,
  "limit": 10
}
```

**Error Responses:**
- 400 Bad Request: If pagination parameters are invalid
- 500 Internal Server Error: If an unexpected error occurs

#### Monthly Transactions

```http
GET /last-month
```

Retrieves transactions from the last month with pagination.

**Parameters:**
- Same pagination and filtering parameters as `/all-transactions`

**Response:** Same structure as `/all-transactions`

```http
GET /last-month-summary
```

Fetches the last month trades summary.

**Parameters:** None

**Response (200 OK):**
```json
{
  "totalTransactions": 1200,
  "buyTransactions": 700,
  "sellTransactions": 500,
  "totalVolumeUsd": 125000,
  "totalVolumeSol": 1250,
  "uniqueUsers": 350,
  "startDate": "2025-03-15T00:00:00Z",
  "endDate": "2025-04-15T00:00:00Z"
}
```

#### Transaction Statistics

```http
GET /count-comparison
```

Fetches transaction count comparison data between current and previous periods.

**Parameters:** None

**Response (200 OK):**
```json
{
  "currentPeriodCount": 1200,
  "previousPeriodCount": 1000,
  "percentageChange": 20,
  "period": "monthly"
}
```

```http
GET /amount-comparison
```

Retrieves transaction amount comparison data between current and previous periods.

**Parameters:** None

**Response (200 OK):**
```json
{
  "currentPeriodAmount": 125000,
  "previousPeriodAmount": 100000,
  "percentageChange": 25,
  "period": "monthly",
  "currency": "USD"
}
```

```http
GET /transaction-count-with-volume
```

Fetches total transactions and total volume metrics.

**Parameters:** None

**Response (200 OK):**
```json
{
  "totalTransactions": 5000,
  "totalVolumeUsd": 500000,
  "totalFeesCollected": 7500
}
```

#### Weekly Analysis

```http
GET /current-week-user-summary
```

Retrieves current week user transaction summary.

**Parameters:** None

**Response (200 OK):**
```json
{
  "totalUsers": 350,
  "totalTransactions": 1500,
  "totalVolumeUsd": 150000,
  "totalVolumeSol": 1500,
  "buyTransactions": 900,
  "sellTransactions": 600,
  "weekStartDate": "2025-04-07T00:00:00Z",
  "weekEndDate": "2025-04-13T23:59:59Z"
}
```

### Transaction Confirmation Routes

Base path: `/api/transaction-confirmation`

#### Statistics and Status

```http
GET /stats
```

Retrieves transaction confirmation statistics.

**Parameters:** None

**Response (200 OK):**
```json
{
  "pendingCount": 25,
  "confirmedCount": 975,
  "failedCount": 5,
  "totalCount": 1005,
  "averageConfirmationTime": "2.5 minutes"
}
```

```http
GET /pending
```

Gets list of pending transactions.

**Parameters:**
- `page` (number, optional): Page number for pagination (default: 1)
- `limit` (number, optional): Number of results per page (default: 10)

**Response (200 OK):**
```json
{
  "pendingTransactions": [
    {
      "signature": "transaction_signature",
      "telegramId": 123456789,
      "type": "buy",
      "amount": 0.5,
      "tokenSymbol": "SOL",
      "submittedAt": "2025-04-15T12:00:00Z",
      "attempts": 2
    }
  ],
  "totalPending": 25,
  "totalPages": 3,
  "currentPage": 1,
  "limit": 10
}
```

#### Transaction Details

```http
GET /details/:signature
```

Fetches details for a specific transaction by signature.

**Parameters:**
- `signature` (string, required): Transaction signature/ID (path parameter)

**Response (200 OK):**
```json
{
  "signature": "transaction_signature",
  "telegramId": 123456789,
  "type": "buy",
  "amount": 0.5,
  "amountInToken": 100,
  "tokenSymbol": "SOL",
  "tokenAddress": "token_address",
  "valueUsd": 50,
  "transactionFee": 0.01,
  "status": "completed",
  "confirmations": 32,
  "blockHeight": 12345678,
  "submittedAt": "2025-04-15T12:00:00Z",
  "confirmedAt": "2025-04-15T12:01:30Z"
}
```

**Error Responses:**
- 404 Not Found: If transaction with signature not found
- 500 Internal Server Error: If an unexpected error occurs

#### Transaction Processing

```http
POST /verify
```

Verifies a specific transaction.

**Request Body:**
```json
{
  "signature": "transaction_signature"
}
```

**Parameters:**
- `signature` (string, required): Transaction signature to verify

**Response (200 OK):**
```json
{
  "success": true,
  "status": "confirmed",
  "confirmations": 32
}
```

```http
POST /process-all
```

Processes all pending transactions.

**Parameters:** None

**Response (200 OK):**
```json
{
  "success": true,
  "processed": 25,
  "confirmed": 20,
  "failed": 5
}
```

**Error Responses:**
- 400 Bad Request: If parameters are invalid
- 500 Internal Server Error: If an unexpected error occurs
