# Weekly Winner Routes

Base path: `/api/weekly-winners`

### Available Endpoints

#### Winner Management

```http
POST /create-current-week-winners
```

Creates winners for the current week competition.

#### Winner Listing

```http
GET /get-all-weekly-winners
```

Retrieves all weekly winners with pagination.

#### Pending Winners

```http
GET /get-weekly-winners-not-approved
```

Gets top 3 users for remaining weeks that haven't been approved yet.

#### Winner Approval

```http
POST /approve-weekly-winners
```

Approves selected weekly winners and processes their rewards.

### Prize Distribution

Winners are selected based on trading volume and activity. The system automatically calculates and distributes rewards according to pre-configured percentages for top performers.
