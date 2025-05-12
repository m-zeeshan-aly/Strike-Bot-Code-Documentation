# Transaction Routes

Base path: `/api/transactions`

### Available Endpoints

#### All Transactions

```http
GET /all-transactions
```

Fetches all transactions with pagination.

#### Monthly Transactions

```http
GET /last-month
```

Retrieves transactions from the last month with pagination.

```http
GET /last-month-summary
```

Fetches the last month trades summary.

#### Transaction Statistics

```http
GET /count-comparison
```

Fetches transaction count comparison data.

```http
GET /amount-comparison
```

Retrieves transaction amount comparison data.

```http
GET /transaction-count-with-volume
```

Fetches total transactions and total volume metrics.

#### Weekly Analysis

```http
GET /current-week-user-summary
```

Retrieves current week user transaction summary.

### Transaction Confirmation Routes

Base path: `/api/transaction-confirmation`

#### Statistics and Status

```http
GET /stats
```

Retrieves transaction confirmation statistics.

```http
GET /pending
```

Gets list of pending transactions.

#### Transaction Details

```http
GET /details/:signature
```

Fetches details for a specific transaction by signature.

#### Transaction Processing

```http
POST /verify
```

Verifies a specific transaction.

```http
POST /process-all
```

Processes all pending transactions.
