# Referral Routes

Base path: `/api/referrals`

### Available Endpoints

#### Referral Management

```http
GET /get-all-referrals
```

Retrieves all referrals with filters and pagination support. Used to view and manage the referral network.

#### Commission Settings

```http
POST /update-referral-commission
```

Updates the custom commission rate for a specific user identified by their Telegram ID.

### Referral System

The referral system allows users to:

* Earn commission by referring new users
* Track their referral network
* Manage custom commission rates for specific users
* Monitor referral performance and earnings
