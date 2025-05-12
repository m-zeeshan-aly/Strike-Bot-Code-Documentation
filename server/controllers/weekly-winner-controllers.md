# Weekly Winner Controllers

### Overview

Weekly Winner controllers manage the weekly competition system, including winner selection, prize distribution, and history tracking.

### Available Controllers

#### Winner Management

```typescript
POST /api/weekly-winners/create-current-week-winners
```

**Controller**: `createWeeklyWinnersController`

* Creates winners for the current week
* Validates winner positions and data
* Ensures no duplicate winners for the same period

**Request Body Format**:

```json
{
  "winners": [
    { "position": 1, "userId": "641a..." },
    { "position": 2, "userId": "642b..." },
    { "position": 3, "userId": "643c..." }
  ]
}
```

#### Winner History

```typescript
GET /api/weekly-winners/get-all-weekly-winners
```

**Controller**: `getPaginatedWeeklyWinnersController`

* Retrieves historical weekly winners with pagination
* Supports filtering by date range and telegram ID
* Includes sorting options

**Query Parameters**:

* `page`: Page number (default: 1)
* `limit`: Items per page (default: 10)
* `telegramId`: Filter by winner's telegram ID
* `startDate`: Filter by start date
* `endDate`: Filter by end date
* `sortField`: Field to sort by ('createdAt' or 'weekStartDate')
* `sortOrder`: Sort direction ('asc' or 'desc')

#### Pending Winners

```typescript
GET /api/weekly-winners/get-weekly-winners-not-approved
```

**Controller**: `getWeeklyTransactionsController`

* Fetches top 3 users for remaining weeks
* Includes transaction volume and entry count
* Supports pagination and date filtering

#### Winner Approval

```typescript
POST /api/weekly-winners/approve-weekly-winners
```

**Controller**: `postWeeklyWinnersController`

* Approves and processes weekly winners
* Validates week dates (Monday to Sunday)
* Handles prize distribution

**Request Body Format**:

```json
{
  "startDate": "2025-05-06",
  "endDate": "2025-05-12",
  "winners": [6931891527, 123456789]
}
```

### Prize Distribution System

The weekly winner system follows these rules:

* First place receives 50% of the prize pool
* Second place receives 30% of the prize pool
* Third place receives 20% of the prize pool

### Response Format Examples

#### Weekly Winners List Response

```json
{
  "winners": [
    {
      "telegramId": 123456789,
      "username": "john_doe",
      "winningAmount": 500,
      "winningPercentage": 50,
      "position": 1,
      "weekStartDate": "2025-05-06T00:00:00Z",
      "weekEndDate": "2025-05-12T23:59:59Z"
    }
  ],
  "totalWinners": 1,
  "page": 1,
  "limit": 10
}
```

#### Winner Creation Response

```json
{
  "success": true,
  "message": "Winners for the week successfully created"
}
```
