# Constants Routes

## Constants Routes Documentation

Base path: `/api/constants`

### Available Endpoints

#### Update Winner Percentages

```http
POST /update-winner-percentages
```

Updates the percentage distribution for weekly winners.

**Request Body:**
```json
{
  "winnerFirstWinPercentage": 50,
  "winnerSecondWinPercentage": 30,
  "winnerThirdWinPercentage": 20
}
```

**Parameters:**
- `winnerFirstWinPercentage` (number, required): Percentage for first position winner (0-100)
- `winnerSecondWinPercentage` (number, required): Percentage for second position winner (0-100)
- `winnerThirdWinPercentage` (number, required): Percentage for third position winner (0-100)

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Winner percentages updated successfully.",
  "updatedValues": {
    "winnerFirstWinPercentage": 50,
    "winnerSecondWinPercentage": 30,
    "winnerThirdWinPercentage": 20
  }
}
```

**Error Responses:**
- 400 Bad Request: If the percentages are invalid or sum exceeds 100%
- 500 Internal Server Error: If an unexpected error occurs

#### Prize Pool Information

```http
GET /winners-and-prize-pool
```

Fetches winners data, prize pool information, and current Solana balance.

**Parameters:** None

**Response (200 OK):**
```json
{
  "winnerFirstWinPercentage": 50,
  "winnerSecondWinPercentage": 30,
  "winnerThirdWinPercentage": 20,
  "defaultCommissionPercentage": 1.5,
  "solanaBalance": 100.5,
  "prizePoolBalance": 50.25,
  "currentWeekContributions": 10.75,
  "lastUpdated": "2025-04-15T12:00:00Z"
}
```

**Error Responses:**
- 404 Not Found: If constants are not configured in the database
- 500 Internal Server Error: If an unexpected error occurs

#### Commission Management

```http
POST /update-commission
```

Updates the system-wide commission rate.

**Request Body:**
```json
{
  "commissionPercentage": 1.5
}
```

**Parameters:**
- `commissionPercentage` (number, required): New commission percentage (0-100)

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Commission rate updated successfully.",
  "oldCommissionRate": 1.0,
  "newCommissionRate": 1.5,
  "effectiveFrom": "2025-04-15T12:30:00Z"
}
```

**Error Responses:**
- 400 Bad Request: If the commission percentage is invalid
- 500 Internal Server Error: If an unexpected error occurs

### System Constants

The constants routes manage critical system parameters that affect:

* Prize distribution percentages for weekly winners - determines how the prize pool is distributed among the top 3 winners
* Commission rates for transactions - the percentage fee charged on each trade
* Prize pool calculations and distribution - how much of each transaction fee goes to the prize pool
* System-wide configuration values - global settings that affect the entire platform

Constants are stored in the MongoDB database in the `Constants` collection and are loaded at system startup. Changes to constants take effect immediately and do not require system restart.

Default values:
* First place winner: 50% of prize pool
* Second place winner: 30% of prize pool
* Third place winner: 20% of prize pool
* Default platform commission: 1.5% of trade value

Prize pool funding:
* 30% of all platform fees are allocated to the weekly prize pool
* 70% of platform fees go to the platform operator wallet
