# API Overview

## Base URL

The API base URL depends on your deployment environment:

* Local Development: `http://localhost:3000/api`
* Production: Your deployed server URL

## Authentication

All API endpoints (except `/health`) require JWT authentication. Include the JWT token in the Authorization header:

```http
Authorization: Bearer <your-jwt-token>
```

## Response Format

All responses are returned in JSON format:

* Successful responses: HTTP 200 with response data
* Error responses: Appropriate 4xx or 5xx status codes with error message

### Common HTTP Status Codes

* `200 OK`: Request successful
* `400 Bad Request`: Invalid request parameters
* `401 Unauthorized`: Missing or invalid authentication token
* `404 Not Found`: Requested resource not found
* `500 Internal Server Error`: Server-side error
