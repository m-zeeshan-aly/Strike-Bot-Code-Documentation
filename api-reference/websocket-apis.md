# WebSocket APIs

The Strike Bot system uses WebSocket connections for real-time updates and notifications.

### Connection Details

#### Base WebSocket URL

```
ws://localhost:3000/ws
```

#### Authentication

WebSocket connections require initial authentication via token:

```json
{
  "type": "auth",
  "token": "YOUR_AUTH_TOKEN"
}
```

### Available Channels

#### Price Updates Channel

Subscribe to real-time price updates for tokens.

**Subscribe:**

```json
{
  "action": "subscribe",
  "channel": "prices",
  "tokens": ["SOL", "USDT"]
}
```

**Message Format:**

```json
{
  "type": "price_update",
  "data": {
    "token": "SOL",
    "price": "123.45",
    "timestamp": "2025-05-12T10:30:00Z"
  }
}
```

#### Transaction Status Channel

Real-time updates for transaction confirmations.

**Subscribe:**

```json
{
  "action": "subscribe",
  "channel": "transactions",
  "signatures": ["tx_signature_1", "tx_signature_2"]
}
```

**Message Format:**

```json
{
  "type": "transaction_update",
  "data": {
    "signature": "tx_signature_1",
    "status": "confirmed",
    "confirmations": 32,
    "timestamp": "2025-05-12T10:30:00Z"
  }
}
```

#### User Activity Channel

Real-time updates for user activities and notifications.

**Subscribe:**

```json
{
  "action": "subscribe",
  "channel": "user_activity",
  "userId": "user_telegram_id"
}
```

**Message Format:**

```json
{
  "type": "activity_update",
  "data": {
    "userId": "user_telegram_id",
    "action": "trade_completed",
    "details": {
      "amount": "1.23",
      "token": "SOL",
      "type": "buy"
    }
  }
}
```

### Error Messages

WebSocket error messages follow this format:

```json
{
  "type": "error",
  "code": "ERROR_CODE",
  "message": "Error description"
}
```

Common Error Codes:

* `AUTH_FAILED`: Authentication failed
* `INVALID_SUBSCRIPTION`: Invalid subscription request
* `RATE_LIMIT`: Too many messages
* `INVALID_MESSAGE`: Malformed message

### Connection Management

#### Heartbeat

The server sends heartbeat messages every 30 seconds:

```json
{
  "type": "heartbeat",
  "timestamp": "2025-05-12T10:30:00Z"
}
```

Client should respond with:

```json
{
  "type": "pong"
}
```

#### Reconnection

Implement exponential backoff when reconnecting:

* Initial delay: 1 second
* Maximum delay: 30 seconds
* Maximum attempts: 10

### Best Practices

1. **Message Processing**
   * Implement message queuing
   * Handle messages asynchronously
   * Validate message format before processing
2. **Connection Handling**
   * Monitor connection health with heartbeats
   * Implement automatic reconnection
   * Buffer messages during reconnection
3. **Performance**
   * Limit subscriptions to necessary channels
   * Batch subscription requests
   * Implement message rate limiting

### Example Usage

```javascript
const ws = new WebSocket('ws://localhost:3000/ws');

ws.onopen = () => {
  // Authenticate
  ws.send(JSON.stringify({
    type: 'auth',
    token: 'YOUR_AUTH_TOKEN'
  }));

  // Subscribe to channels
  ws.send(JSON.stringify({
    action: 'subscribe',
    channel: 'prices',
    tokens: ['SOL']
  }));
};

ws.onmessage = (event) => {
  const message = JSON.parse(event.data);
  switch (message.type) {
    case 'price_update':
      handlePriceUpdate(message.data);
      break;
    case 'error':
      handleError(message);
      break;
    case 'heartbeat':
      ws.send(JSON.stringify({ type: 'pong' }));
      break;
  }
};

ws.onclose = () => {
  // Implement reconnection logic
};
```
