# Hide and Unhide Tokens

#### Overview <a href="#overview" id="overview"></a>

The Hide/Unhide Tokens feature in Strike Bot allows users to manage the visibility of tokens in their portfolio. This functionality is particularly useful for users who hold many different tokens and want to organize their portfolio view by hiding low-value, inactive, or unwanted tokens while still maintaining them in their wallet.

#### Key Features <a href="#key-features" id="key-features"></a>

* **Token Hiding**: Remove specific tokens from display in portfolio views
* **Token Unhiding**: Restore visibility of previously hidden tokens
* **Hidden Tokens List**: View and manage all currently hidden tokens
* **Quick Access**: Hide tokens directly from positions or sell menus
* **Token Filtering**: Automatically filters hidden tokens from all portfolio displays
* **Persistent Settings**: Hidden token preferences are saved between sessions

#### How to Use Hide/Unhide Tokens <a href="#how-to-use-hide-unhide-tokens" id="how-to-use-hide-unhide-tokens"></a>

#### Hiding a Token

There are multiple ways to hide a token:

1. **From Settings Menu**:

* Navigate to Settings → Hidden Tokens
* Select "Hide a Token"
* Enter the token's contract address

2. **From Positions Menu**:

* Find the token you want to hide
* Click the \[Hide] link next to the token

3. **From Quick Links**:

* Use direct link: `t.me/YourBotUsername?start=hideToken-{tokenAddress}`

**Unhiding a Token**

To make a hidden token visible again:

1. **From Hidden Tokens List**:

* Navigate to Settings → Hidden Tokens
* Find the token you want to unhide
* Click the \[Unhide] link next to it

2. **From Quick Links**:

* Use direct link: `t.me/YourBotUsername?start=unhideToken-{tokenAddress}`

#### Behind the Scenes <a href="#behind-the-scenes" id="behind-the-scenes"></a>

**Technical Implementation**

The Hide/Unhide Tokens feature is built on several components:

* **Hidden Tokens Database**: MongoDB collection storing user token preferences
* **Token Filtering Service**: Automatically filters hidden tokens from portfolio views
* **Validation System**: Ensures only valid token addresses can be hidden
* **User Preferences**: Integrated with the user settings system

**How Token Filtering Works**

1. When retrieving wallet contents for display, the system checks each token against the user's hidden list
2. Hidden tokens are excluded from portfolio views, sell menus, and positions displays
3. The actual tokens remain in the user's wallet and are not affected in any way
4. Hidden tokens are only filtered from the UI, not from actual wallet operations

#### Example Use Cases <a href="#example-use-cases" id="example-use-cases"></a>

**Portfolio Cleanup**

Alex has accumulated many "dust" tokens from airdrops and small trades. Using the Hide Tokens feature, he can clean up his portfolio view without having to sell or transfer these small token amounts.

**Focus on Active Investments**

Maria actively trades only 5-10 tokens but holds over 30 different tokens in her wallet. By hiding the inactive tokens, she can focus her Positions view on just the tokens she's actively managing.

**Preparing for Presentations**

Carlos wants to share his portfolio performance with friends but doesn't want to show certain tokens. He temporarily hides these tokens before taking a screenshot of his positions.

#### Important Considerations <a href="#important-considerations" id="important-considerations"></a>

* **Wallet Contents**: Hiding tokens does not remove them from your wallet or affect your ownership
* **Trading Hidden Tokens**: You can still trade hidden tokens by entering their address manually
* **Token Identification**: Save token addresses before hiding them if you plan to unhide later
* **Swap Operations**: Hidden tokens can still be used in swap operations
* **Burn Tokens Option**: For actual removal of token accounts to reclaim rent, use the separate "Burn Tokens" feature

#### Troubleshooting <a href="#troubleshooting" id="troubleshooting"></a>

Common issues and solutions:

* **Token Still Visible**: Try refreshing your positions view after hiding a token
* **Can't Find Hidden Token**: Check the full Hidden Tokens list in settings
* **Invalid Address Error**: Ensure you're entering a valid SPL token mint address
* **Unhide Not Working**: Verify you're using the exact token address that was hidden
