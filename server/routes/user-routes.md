# User Routes

Base path: `/api/users`

### Available Endpoints

#### Get All Users

```http
GET /get-all-users
```

Fetches all users with pagination.

#### Top Users Endpoints

```http
GET /top-10-users
```

Retrieves the top 10 users with the highest transaction volume and total trades.

```http
GET /top-10-users-previous-month
```

Fetches the top 10 users for the previous calendar month.

```http
GET /top-10-users-current-week
```

Retrieves top 10 users for the current week.

#### User Statistics

```http
GET /user-count-comparison
```

Fetches user count, percentage change, and total database count.

```http
GET /active-user-count-comparison
```

Retrieves active user count and percentage change.

#### Active Users Analysis

```http
GET /active-users-30-days
```

Fetches list of active users in the last 30 days.

```http
GET /active-users-count-30-days
```

Returns active user count for the last 30 days.

```http
GET /active-user-count-and-comparison
```

Provides active user count for last 30 days with comparison metrics.

#### User Details

```http
GET /get-user-details-by-telegram-id
```

Fetches user details using their Telegram ID.

```http
GET /get-user-transactions-by-telegram-id
```

Retrieves user transactions by Telegram ID with pagination.

#### User Management

```http
POST /block-or-unblock-user
```

Blocks or unblocks a user from using the system.
