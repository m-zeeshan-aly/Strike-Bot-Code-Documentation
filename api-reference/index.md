# API Reference

This section provides detailed information about all available API endpoints in the Strike Bot application. The API is built using the Hono framework and provides comprehensive functionality for managing users, transactions, weekly winners, constants, referrals, and more.

## Authentication

All API endpoints (except `/health`) require JWT authentication. Include the JWT token in the Authorization header:

```http
Authorization: Bearer <your-jwt-token>
```

## Base URL

The API base URL is `/api`. For example:

- Local Development: `http://localhost:8008/api`
- Production: `https://your-domain.com/api`

## Response Format

All responses are returned in JSON format. Successful responses have a 200 status code, while errors return appropriate 4xx or 5xx status codes.

### Common Error Responses

- `401 Unauthorized`: Missing or invalid authentication token
- `400 Bad Request`: Invalid request parameters
- `404 Not Found`: Requested resource not found
- `500 Internal Server Error`: Server-side error

## Rate Limiting

The API implements rate limiting to protect against abuse. Rate limits are based on IP address and authenticated user.
