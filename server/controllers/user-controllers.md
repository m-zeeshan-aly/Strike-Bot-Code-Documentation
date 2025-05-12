# User Controllers

### Overview

User controllers handle all user-related operations including user management, statistics, and activity tracking.

### Available Controllers

#### Get All Users

```typescript
GET /api/users/get-all-users
```

**Controller**: `getAllUsersController`

* Fetches all users with pagination
* Supports filtering by telegramId, blocked status, and date range
* Allows sorting by creation date

**Query Parameters**:

* `page`: Page number (default: 1)
* `limit`: Items per page (default: 10)
* `telegramId`: Filter by telegram ID
* `isBlocked`: Filter by blocked status
* `createdAtStart`: Filter by creation date start
* `createdAtEnd`: Filter by creation date end
* `sortField`: Field to sort by
* `sortOrder`: Sort direction ('asc' or 'desc')

#### User Statistics

```typescript
GET /api/users/user-count-comparison
GET /api/users/active-user-count-comparison
GET /api/users/active-users-30-days
GET /api/users/active-users-count-30-days
```

**Controllers**:

* `getUserCountAndPercentageChangeController`
* `getActiveUserCountAndComparisonController`
* `getActiveUsersLast30DaysController`
* `getActiveUserCountLast30DaysController`

#### Top Users

```typescript
GET /api/users/top-10-users
GET /api/users/top-10-users-previous-month
GET /api/users/top-10-users-current-week
```

**Controllers**:

* `getTop10TransactionAmountUsersController`
* `getTop10PreviousMonthTransactionAmountUsersController`
* `getTop10WeekCurrentTransactionAmountUsersController`

#### User Details

```typescript
GET /api/users/get-user-details-by-telegram-id
GET /api/users/get-user-transactions-by-telegram-id
```

**Controllers**:

* `getUserDetailsByTelegramIdController`
* `getUserTransactionsByTelegramId`

#### User Management

```typescript
POST /api/users/block-or-unblock-user
```

**Controller**: `blockOrUnblockUserController`

* Blocks or unblocks users
* Supports adding blocking reason
* Updates user status in the system

#### Blocked Users Management

```typescript
GET /api/blocked-users/get-all-users-blocked
POST /api/blocked-users/block-or-unblock-user-with-detail
```

**Controllers**:

* `getBlockedUsersController`
* `blockOrUnblockUserWithDetailsController`
