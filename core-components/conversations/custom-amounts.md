# Custom Amounts

## Custom Amount Conversations

Handles custom transaction amounts for buying and selling tokens. These conversations manage user input validation and processing for both SOL-based and percentage-based transactions.

### Flow Overview

```typescript
Input → Validation → Confirmation → Update → Result

1. Input Stage
   - SOL Amount: "Enter SOL amount (min 0.001)"
   - Percentage: "Enter sell percentage (1-100%)"

2. Validation Checks
   - Format validation (numbers only)
   - Range checks
     * SOL: >= 0.001
     * Percentage: 1-100%
   - Balance verification
   - Market liquidity check

3. Transaction Preview
   - Estimated output
   - Fee calculation
   - Slippage impact
```

### Key Conversations

#### 1. Custom SOL Amount

```typescript
Flow:
1. User initiates buy/sell
2. Prompts for SOL amount
3. Validates input:
   - Number format
   - Minimum amount
   - Available balance
4. Shows transaction preview
5. Proceeds to trade execution
```

#### 2. Custom Sell Percentage

```typescript
Flow:
1. User selects sell
2. Prompts for percentage
3. Validates input:
   - Valid percentage
   - Token balance check
4. Calculates SOL equivalent
5. Proceeds to confirmation
```

### Error Handling

* Invalid input → Retry prompt
* Insufficient balance → Balance display
* Network issues → Retry option
* Timeout → Conversation reset

### User Experience Notes

* Clear numeric input prompts
* Immediate validation feedback
* Balance updates in real-time
* Simple retry mechanisms
* Conversation cancellation option

### Integration Points

* Links to slippage settings
* Connects to trade execution
* Updates user session data
* Syncs with wallet balance
