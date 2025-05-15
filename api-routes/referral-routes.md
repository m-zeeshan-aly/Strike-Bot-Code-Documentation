# Referral Routes

Base path: `/api/referrals`

### Available Endpoints

#### Get All Referrals

```http
GET /get-all-referrals
```

Retrieves all referrals with filters and pagination support. Used to view and manage the referral network.

**Parameters:**
- `page` (number, optional): Page number for pagination (default: 1)
- `limit` (number, optional): Number of results per page (default: 10)
- `referrerId` (string, optional): Filter by referrer Telegram ID
- `refereeId` (string, optional): Filter by referee Telegram ID
- `startDate` (string, optional): Filter by referral date range start (format: YYYY-MM-DD)
- `endDate` (string, optional): Filter by referral date range end (format: YYYY-MM-DD)
- `sortField` (string, optional): Field to sort by (e.g., 'createdAt', 'commissionEarned')
- `sortOrder` (string, optional): Sort order ('asc' or 'desc', default: 'desc')

**Response (200 OK):**
```json
{
  "referrals": [
    {
      "referrerId": 123456789,
      "referrerUsername": "john_doe",
      "refereeId": 987654321,
      "refereeUsername": "jane_smith",
      "commissionEarned": 1.5,
      "commissionCurrency": "SOL",
      "customCommissionRate": 2.5,
      "createdAt": "2025-04-15T12:00:00Z"
    }
  ],
  "totalReferrals": 50,
  "totalPages": 5,
  "currentPage": 1,
  "limit": 10
}
```

**Error Responses:**
- 400 Bad Request: If pagination parameters are invalid
- 500 Internal Server Error: If an unexpected error occurs

#### Update Custom Commission Rate

```http
POST /update-referral-commission
```

Updates the custom commission rate for a specific user identified by their Telegram ID.

**Request Body:**
```json
{
  "telegramId": 123456789,
  "customCommissionRate": 2.5
}
```

**Parameters:**
- `telegramId` (number, required): Telegram ID of the user
- `customCommissionRate` (number, required): Custom commission percentage (0-100)

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Custom commission rate updated successfully.",
  "telegramId": 123456789,
  "customCommissionRate": 2.5,
  "commissionSetAt": "2025-04-15T12:30:00Z"
}
```

**Error Responses:**
- 400 Bad Request: If parameters are invalid or user doesn't exist
- 404 Not Found: If user with telegramId not found
- 500 Internal Server Error: If an unexpected error occurs

### Referral System

The referral system allows users to:

* Earn commission by referring new users
* Track their referral network
* Manage custom commission rates for specific users
* Monitor referral performance and earnings

The referral structure is a two-tier system:
1. **Direct referrals (Tier 1)**: Users directly referred by you
2. **Indirect referrals (Tier 2)**: Users referred by your direct referrals

Commission rates:
* Direct referral commission: 50% of platform fees from referred user's trades
* Indirect referral commission: 10% of platform fees from indirectly referred user's trades
* Custom commission rates can be set by administrators for specific users

All commissions are paid in SOL and are automatically calculated based on the trading volume of referred users. Commissions are accumulated and can be withdrawn to the user's designated rewards wallet.
