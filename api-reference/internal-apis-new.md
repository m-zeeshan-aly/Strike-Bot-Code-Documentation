# Internal APIs

## User Management APIs

Base path: `/api/users`

### Get All Users
```http
GET /users/get-all-users
```
Query Parameters:
- `page` (integer, optional): Page number for pagination (default: 1)
- `limit` (integer, optional): Users per page (default: 10)
- `telegramId` (string, optional): Filter by Telegram ID
- `isBlocked` (boolean, optional): Filter by blocked status
- `createdAtStart` (string, optional): Filter by creation date start
- `createdAtEnd` (string, optional): Filter by creation date end
- `sortField` (string, optional): Field to sort by (default: createdAt)
- `sortOrder` (string, optional): Sort order (asc/desc)

### User Activity Statistics
```http
GET /users/active-users-30-days
```
Returns active users in the last 30 days

```http
GET /users/active-users-count-30-days
```
Returns count of active users in the last 30 days

```http
GET /users/active-user-count-and-comparison
```
Returns active user count comparison with previous period

### Top Users
```http
GET /users/top-10-users
```
Returns top 10 users by transaction volume

```http
GET /users/top-10-users-previous-month
```
Returns top 10 users from previous month

```http
GET /users/top-10-users-current-week
```
Returns top 10 users for current week

### User Details
```http
GET /users/get-user-details-by-telegram-id
```
Query Parameters:
- `telegramId` (string, required): Telegram ID of the user

```http
GET /users/get-user-transactions-by-telegram-id
```
Get transactions for a specific user

### User Management
```http
POST /users/block-or-unblock-user
```
Request Body:
```json
{
  "telegramId": number,
  "action": "block" | "unblock"
}
```

## Transaction Management APIs

Base path: `/api/transactions`

### Get Transactions
```http
GET /transactions/all-transactions
```
Query Parameters:
- `page` (integer, optional): Page number (default: 1)
- `limit` (integer, optional): Transactions per page (default: 10)
- `createdAtStart` (string, optional): Start date filter
- `createdAtEnd` (string, optional): End date filter
- `telegramId` (string, optional): Filter by user
- `isReferral` (boolean, optional): Filter referral transactions

### Transaction Statistics
```http
GET /transactions/last-month-summary
```
Returns last month's trading summary

```http
GET /transactions/last-month
```
Returns last month's transactions with pagination

```http
GET /transactions/count-comparison
```
Returns transaction count comparison

```http
GET /transactions/amount-comparison
```
Returns transaction amount comparison

```http
GET /transactions/transaction-count-with-volume
```
Returns total transaction count and volume

```http
GET /transactions/current-week-user-summary
```
Returns current week's summary per user

## Weekly Winner APIs

Base path: `/api/weekly-winners`

### Winner Management
```http
POST /weekly-winners/create-current-week-winners
```
Creates winners for current week

```http
GET /weekly-winners/get-all-weekly-winners
```
Returns all weekly winners with pagination

```http
GET /weekly-winners/get-weekly-winners-not-approved
```
Returns pending weekly winners

```http
POST /weekly-winners/approve-weekly-winners
```
Approves selected weekly winners

## Constants Management APIs

Base path: `/api/constants`

```http
POST /constants/update-winner-percentages
```
Updates prize distribution percentages

```http
GET /constants/winners-and-prize-pool
```
Returns winner percentages and prize pool data

```http
POST /constants/update-commission
```
Updates platform commission rate

## Referral Management APIs

Base path: `/api/referrals`

```http
GET /referrals/get-all-referrals
```
Query Parameters:
- `page` (integer, optional): Page number
- `limit` (integer, optional): Items per page
- `telegramId` (string, optional): Filter by referrer
- `referralBlocked` (boolean, optional): Filter by status

```http
POST /referrals/update-referral-commission
```
Updates referral commission rate for user

## Blocked Users APIs

Base path: `/api/blocked-users`

```http
GET /blocked-users/get-all-users-blocked
```
Returns list of all blocked users

```http
POST /blocked-users/block-or-unblock-user-with-detail
```
Block/unblock user with additional details

## Transaction Confirmation APIs

Base path: `/api/transaction-confirmation`

```http
GET /transaction-confirmation/stats
```
Returns transaction confirmation statistics

```http
GET /transaction-confirmation/pending
```
Returns pending transactions

```http
GET /transaction-confirmation/details/:signature
```
Returns details for specific transaction

```http
POST /transaction-confirmation/verify
```
Verifies a transaction

```http
POST /transaction-confirmation/process-all
```
Processes all pending transactions
