# Weekly Winner Routes

Base path: `/api/weekly-winners`

### Available Endpoints

#### Winner Management

```http
POST /create-current-week-winners
```

Creates winners for the current week competition.

**Request Body:**
```json
{
  "winners": [
    {
      "position": 1,
      "telegramId": 123456789
    },
    {
      "position": 2,
      "telegramId": 987654321
    },
    {
      "position": 3,
      "telegramId": 456789123
    }
  ]
}
```

**Parameters:**
- `winners` (array, required): Array of 3 winners with position and telegramId

**Response (201 Created):**
```json
{
  "_id": "winner_document_id",
  "weekStartDate": "2025-04-13T00:00:00Z",
  "weekEndDate": "2025-04-19T23:59:59Z",
  "winners": [
    {
      "position": 1,
      "userId": "user_id_1",
      "winningAmount": 500,
      "winningPercentage": 50
    },
    {
      "position": 2,
      "userId": "user_id_2",
      "winningAmount": 300,
      "winningPercentage": 30
    },
    {
      "position": 3,
      "userId": "user_id_3",
      "winningAmount": 200,
      "winningPercentage": 20
    }
  ],
  "createdAt": "2025-04-20T09:15:30Z"
}
```

**Error Responses:**
- 400 Bad Request: If winners data is incomplete or invalid
- 409 Conflict: If weekly winners for this period already exist
- 500 Internal Server Error: If an unexpected error occurs

#### Winner Listing

```http
GET /get-all-weekly-winners
```

Retrieves all weekly winners with pagination.

**Parameters:**
- `page` (number, optional): Page number for pagination (default: 1)
- `limit` (number, optional): Number of results per page (default: 10)
- `startDate` (string, optional): Filter by date range start (format: YYYY-MM-DD)
- `endDate` (string, optional): Filter by date range end (format: YYYY-MM-DD)
- `sortOrder` (string, optional): Sort order ('asc' or 'desc', default: 'desc')

**Response (200 OK):**
```json
{
  "winners": [
    {
      "weekStartDate": "2025-04-13T00:00:00Z",
      "weekEndDate": "2025-04-19T23:59:59Z",
      "telegramId": 123456789,
      "username": "john_doe",
      "winningAmount": 500,
      "winningPercentage": 50,
      "position": 1,
      "createdAt": "2025-04-20T09:15:30Z"
    }
  ],
  "totalWinners": 15,
  "totalPages": 2,
  "currentPage": 1,
  "limit": 10
}
```

**Error Responses:**
- 400 Bad Request: If pagination parameters are invalid
- 500 Internal Server Error: If an unexpected error occurs

#### Pending Winners

```http
GET /get-weekly-winners-not-approved
```

Gets top 3 users for remaining weeks that haven't been approved yet.

**Parameters:**
- `page` (number, optional): Page number for pagination (default: 1)
- `limit` (number, optional): Number of results per page (default: 10)
- `startDate` (string, optional): Filter by date range start (format: YYYY-MM-DD)
- `endDate` (string, optional): Filter by date range end (format: YYYY-MM-DD)
- `sortOrder` (string, optional): Sort order ('asc' or 'desc', default: 'desc')

**Response (200 OK):**
```json
{
  "transactionsByWeek": [
    {
      "weekStartDate": "2025-04-06T00:00:00Z",
      "weekEndDate": "2025-04-12T23:59:59Z",
      "totalPrizePoolContribution": 100.5,
      "totalTransactionCount": 1200,
      "totalTransactionAmount": 25000,
      "top3Users": [
        {
          "userId": "user_id_1",
          "telegramId": 123456789,
          "totalAmount": 5000,
          "totalUsd": 25000,
          "transactionCount": 45,
          "position": 1,
          "entries": 250
        },
        {
          "userId": "user_id_2",
          "telegramId": 987654321,
          "totalAmount": 3000,
          "totalUsd": 15000,
          "transactionCount": 30,
          "position": 2,
          "entries": 150
        },
        {
          "userId": "user_id_3",
          "telegramId": 456789123,
          "totalAmount": 2000,
          "totalUsd": 10000,
          "transactionCount": 20,
          "position": 3,
          "entries": 100
        }
      ]
    }
  ],
  "totalWeeks": 4,
  "totalPages": 1,
  "currentPage": 1,
  "limit": 10
}
```

**Error Responses:**
- 400 Bad Request: If pagination parameters are invalid
- 500 Internal Server Error: If an unexpected error occurs

#### Winner Approval

```http
POST /approve-weekly-winners
```

Approves selected weekly winners and processes their rewards.

**Request Body:**
```json
{
  "startDate": "2025-04-06T00:00:00Z",
  "endDate": "2025-04-12T23:59:59Z",
  "winners": [123456789, 987654321, 456789123]
}
```

**Parameters:**
- `startDate` (string, required): Week start date in ISO format
- `endDate` (string, required): Week end date in ISO format
- `winners` (array, required): Array of telegram IDs for the winners (in order of position)

**Response (200 OK):**
```json
{
  "message": "Winners data processed and saved successfully.",
  "winnersData": [
    {
      "telegramId": 123456789,
      "userId": "user_id_1",
      "totalAmount": 5000,
      "transactionCount": 45,
      "position": 1,
      "entries": 250,
      "walletAddress": "wallet_address_1",
      "winnerPrize": 50.25,
      "winningPercentage": 50
    },
    {
      "telegramId": 987654321,
      "userId": "user_id_2",
      "totalAmount": 3000,
      "transactionCount": 30,
      "position": 2,
      "entries": 150,
      "walletAddress": "wallet_address_2",
      "winnerPrize": 30.15,
      "winningPercentage": 30
    },
    {
      "telegramId": 456789123,
      "userId": "user_id_3",
      "totalAmount": 2000,
      "transactionCount": 20,
      "position": 3,
      "entries": 100,
      "walletAddress": "wallet_address_3",
      "winnerPrize": 20.1,
      "winningPercentage": 20
    }
  ],
  "solanaBalance": 500.75
}
```

**Error Responses:**
- 400 Bad Request: If parameters are invalid or dates are not in correct format
- 404 Not Found: If no transaction data for the specified week
- 500 Internal Server Error: If an unexpected error occurs

### Prize Distribution

Winners are selected based on trading volume and activity. The system automatically calculates and distributes rewards according to pre-configured percentages for top performers.

The prize distribution process:

1. Users earn entries into the weekly competition based on their trading volume (1 entry per $100 USD in trading volume)
2. At the end of each week (Monday to Sunday), the system identifies the top 3 traders by volume
3. Winners receive a percentage of the prize pool: 1st place (50%), 2nd place (30%), 3rd place (20%)
4. Rewards are automatically sent to winners' wallets after approval
5. Weekly winners are announced to all users through the bot
