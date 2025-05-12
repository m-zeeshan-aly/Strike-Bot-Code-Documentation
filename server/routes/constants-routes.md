# Constants Routes

## Constants Routes Documentation

Base path: `/api/constants`

### Available Endpoints

#### Winner Settings

```http
POST /update-winner-percentages
```

Updates the percentage distribution for weekly winners.

#### Prize Pool

```http
GET /winners-and-prize-pool
```

Fetches winners data, prize pool information, and current Solana balance.

#### Commission Management

```http
POST /update-commission
```

Updates the system-wide commission rate.

### System Constants

The constants routes manage critical system parameters that affect:

* Prize distribution percentages for winners
* Commission rates for transactions
* Prize pool calculations and distribution
* System-wide configuration values
