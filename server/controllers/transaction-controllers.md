# Transaction Controllers

### Overview

Transaction controllers manage all transaction-related operations, including processing, verification, and statistical analysis of transactions.

### Available Controllers

#### Transaction Management

```typescript
GET /api/transactions/all-transactions
```

**Controller**: `getAllTransactionsController`

* Fetches all transactions with pagination
* Supports filtering and sorting options

**Query Parameters**:

* `page`: Page number (default: 1)
* `limit`: Items per page (default: 10)
* `sortField`: Field to sort by
* `sortOrder`: Sort direction ('asc' or 'desc')

#### Transaction Statistics

```typescript
GET /api/transactions/count-comparison
GET /api/transactions/amount-comparison
GET /api/transactions/transaction-count-with-volume
```

**Controllers**:

* `getTransactionCountComparisonController`
* `getTransactionAmountComparisonController`
* `getTotalTransactionAndTotalVolumeController`

#### Monthly Analysis

```typescript
GET /api/transactions/last-month
GET /api/transactions/last-month-summary
```

**Controllers**:

* `getLastMonthTransactionsController`
* `getLastMonthTradesSummaryController`

#### Weekly Analysis

```typescript
GET /api/transactions/current-week-user-summary
```

**Controller**: `getCurrentWeekUserSummaryController`

* Gets current week's summary for specific user
* Includes transaction count and volume

#### Transaction Confirmation

```typescript
GET /api/transaction-confirmation/stats
GET /api/transaction-confirmation/pending
GET /api/transaction-confirmation/details/:signature
POST /api/transaction-confirmation/verify
POST /api/transaction-confirmation/process-all
```

**Controllers**:

* `getTransactionConfirmationStats`
* `getPendingTransactions`
* `getTransactionDetails`
* `verifyTransaction`
* `processPendingTransactions`

### Response Format Examples

#### Transaction List Response

```json
{
  "transactions": [
    {
      "transactionId": "tx123",
      "type": "buy",
      "amount": 10.5,
      "status": "completed",
      "timestamp": "2025-05-12T10:30:00Z"
    }
  ],
  "totalCount": 100,
  "page": 1,
  "limit": 10
}
```

#### Transaction Stats Response

```json
{
  "totalTransactions": 1500,
  "totalTransactionVolume": 5000000,
  "averageTransactionSize": 3333.33
}
```
