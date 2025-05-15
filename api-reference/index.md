# API Reference

This section provides comprehensive documentation for all API endpoints available in the Strikebot Dashboard.

## API Overview

The Strikebot Dashboard exposes several API endpoints for interacting with the system programmatically. These endpoints are organized into the following categories:

- **Authentication API**: Endpoints for user authentication and session management
- **User API**: Endpoints for managing user data
- **Team API**: Endpoints for managing teams
- **Transaction API**: Endpoints for managing and querying transactions
- **Referral API**: Endpoints for managing referrals
- **Analytics API**: Endpoints for retrieving analytics data
- **Proxy API**: Endpoints for proxying requests to external APIs

## Base URL

The base URL for all API endpoints is:

```
https://your-domain.com/api
```

For local development:

```
http://localhost:3000/api
```

## Authentication

Most API endpoints require authentication. Authentication is handled using JWT tokens, which should be included in the `Authorization` header of your requests:

```
Authorization: Bearer <your-jwt-token>
```

JWT tokens are obtained by authenticating via the authentication endpoints.

## Response Format

All API endpoints return responses in JSON format. The general structure of responses is:

```json
{
  "status": "success",
  "data": {
    // Response data here
  }
}
```

For error responses:

```json
{
  "status": "error",
  "error": {
    "code": "ERROR_CODE",
    "message": "Error message"
  }
}
```

## Rate Limiting

API endpoints are subject to rate limiting to prevent abuse. Rate limits are specified in the response headers:

```
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 99
X-RateLimit-Reset: 1620000000
```

## API Endpoints

### Authentication API

#### POST /api/auth/signin

Initiates the sign-in process by sending a magic link to the user's email.

**Request Body:**

```json
{
  "email": "user@example.com"
}
```

**Response:**

```json
{
  "status": "success",
  "data": {
    "message": "Magic link sent to email"
  }
}
```

### User API

#### GET /api/users

Retrieves a list of users.

**Query Parameters:**

- `page` (optional): Page number for pagination
- `limit` (optional): Number of users per page
- `search` (optional): Search term for filtering users

**Response:**

```json
{
  "status": "success",
  "data": {
    "users": [
      {
        "id": "user-id",
        "name": "User Name",
        "email": "user@example.com",
        "role": "admin",
        "createdAt": "2023-01-01T00:00:00Z"
      }
    ],
    "pagination": {
      "total": 100,
      "page": 1,
      "limit": 10,
      "totalPages": 10
    }
  }
}
```

#### GET /api/users/:id

Retrieves a specific user by ID.

**Response:**

```json
{
  "status": "success",
  "data": {
    "user": {
      "id": "user-id",
      "name": "User Name",
      "email": "user@example.com",
      "role": "admin",
      "createdAt": "2023-01-01T00:00:00Z"
    }
  }
}
```

#### POST /api/users

Creates a new user.

**Request Body:**

```json
{
  "name": "New User",
  "email": "newuser@example.com",
  "role": "viewer"
}
```

**Response:**

```json
{
  "status": "success",
  "data": {
    "user": {
      "id": "new-user-id",
      "name": "New User",
      "email": "newuser@example.com",
      "role": "viewer",
      "createdAt": "2023-01-01T00:00:00Z"
    }
  }
}
```

#### PUT /api/users/:id

Updates a user.

**Request Body:**

```json
{
  "name": "Updated User",
  "role": "admin"
}
```

**Response:**

```json
{
  "status": "success",
  "data": {
    "user": {
      "id": "user-id",
      "name": "Updated User",
      "email": "user@example.com",
      "role": "admin",
      "updatedAt": "2023-01-02T00:00:00Z"
    }
  }
}
```

#### DELETE /api/users/:id

Deletes a user.

**Response:**

```json
{
  "status": "success",
  "data": {
    "message": "User deleted successfully"
  }
}
```

### Team API

#### GET /api/teams

Retrieves a list of teams.

**Response:**

```json
{
  "status": "success",
  "data": {
    "teams": [
      {
        "id": "team-id",
        "name": "Team Name",
        "members": [
          {
            "id": "user-id",
            "name": "User Name",
            "email": "user@example.com"
          }
        ],
        "createdAt": "2023-01-01T00:00:00Z"
      }
    ]
  }
}
```

#### POST /api/teams

Creates a new team.

**Request Body:**

```json
{
  "name": "New Team",
  "memberIds": ["user-id-1", "user-id-2"]
}
```

**Response:**

```json
{
  "status": "success",
  "data": {
    "team": {
      "id": "new-team-id",
      "name": "New Team",
      "members": [
        {
          "id": "user-id-1",
          "name": "User 1",
          "email": "user1@example.com"
        },
        {
          "id": "user-id-2",
          "name": "User 2",
          "email": "user2@example.com"
        }
      ],
      "createdAt": "2023-01-01T00:00:00Z"
    }
  }
}
```

### Proxy API

#### GET /api/proxy/:endpoint

Proxies a GET request to an external API.

**Query Parameters:**
- All query parameters are passed through to the external API

**Response:**
- The response from the external API is passed through

#### POST /api/proxy/:endpoint

Proxies a POST request to an external API.

**Request Body:**
- The request body is passed through to the external API

**Response:**
- The response from the external API is passed through

## WebSockets

The Strikebot Dashboard also provides WebSocket endpoints for real-time data:

### /ws/dashboard

Provides real-time updates for the dashboard. Connect to this endpoint using a WebSocket client to receive real-time updates.

**Events:**

- `userActivity`: Sent when a user performs an action
- `newTransaction`: Sent when a new transaction is created
- `systemAlert`: Sent when a system alert is triggered

## Error Codes

| Code | Description |
|------|-------------|
| `UNAUTHORIZED` | The request requires authentication |
| `FORBIDDEN` | The authenticated user does not have permission to access the requested resource |
| `NOT_FOUND` | The requested resource was not found |
| `VALIDATION_ERROR` | The request body failed validation |
| `RATE_LIMIT_EXCEEDED` | The rate limit for the API has been exceeded |
| `INTERNAL_SERVER_ERROR` | An internal server error occurred |

## API Versioning

The API is currently at version 1. The version is implicit in the endpoint URLs. Future versions may be introduced with explicit versioning in the URL path (e.g., `/api/v2/users`).

## API Deprecation

When an API endpoint is deprecated, it will continue to function for a period of time with a deprecation warning in the response headers. Eventually, deprecated endpoints will be removed completely.
