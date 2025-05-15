# Strikebot Dashboard Walkthrough



This document provides a comprehensive walkthrough of the Strikebot Dashboard, explaining how to use each feature and navigate through the different sections.



## Table of Contents



1. [**Getting Started**](#getting-started)

   - [Logging In](#logging-in)

   - [Dashboard Overview](#dashboard-overview)

   - [Navigation](#navigation)



2. [**Main Dashboard**](#main-dashboard)

   - [Key Performance Metrics](#key-performance-metrics)

   - [Charts and Graphs](#charts-and-graphs)

   - [Recent Activity](#recent-activity)



3. [**User Management**](#user-management)

   - [Viewing Users](#viewing-users)

   - [User Details](#user-details)

   - [Adding New Users](#adding-new-users)

   - [Editing Users](#editing-users)

   - [Blocking Users](#blocking-users)



4. [**Team Management**](#team-management)

   - [Team Overview](#team-overview)

   - [Creating Teams](#creating-teams)

   - [Managing Team Members](#managing-team-members)



5. [**Transaction Management**](#transaction-management)

   - [Transaction List](#transaction-list)

   - [Transaction Details](#transaction-details)

   - [Filtering Transactions](#filtering-transactions)



6. [**Top Users Section**](#top-users-section)

   - [Weekly Top Users](#weekly-top-users)

   - [Performance Tracking](#performance-tracking)



7. [**Referral Management**](#referral-management)

   - [Viewing Referrals](#viewing-referrals)

   - [Managing Referrals](#managing-referrals)



8. [**Winners Management**](#winners-management)

   - [Weekly Pools and Approval Process](#weekly-pools-and-approval-process)

   - [Winner Approval Process](#winner-approval-process)

   - [Winners List](#winners-list)



9. [**Settings**](#settings)

   - [Referral Commission Settings](#referral-commission-settings)

   - [Winner Prize Settings](#winner-prize-settings)

   - [Admin Wallet Balance](#admin-wallet-balance)



10. [**Advanced Features**](#advanced-features)

    - [Role-Based Access Control](#role-based-access-control)



---



## Getting Started



### Logging In



1. Navigate to the Strikebot Dashboard login page

2. Enter your email address in the provided field

3. Click "Sign In with Email"

4. Check your email inbox for a magic link

5. Click the magic link to be automatically logged in



> **Note:** The magic link expires after 10 minutes for security purposes. If your link expires, simply request a new one.



**Important Access Control Information:**

- Initially, only users with the **admin** role can access the dashboard

- Non-admin users will see an "Access Denied" message when attempting to log in

- Admin users can add additional administrators and viewers through the Team Management section



### Dashboard Overview



Upon successful login, you'll be directed to the main dashboard, which displays:



- Key performance metrics

- Data visualizations

- Recent user activities

- Quick access to primary features



### Navigation



The dashboard uses a sidebar navigation system:



- **Sidebar:** Located on the left side of the screen, contains links to all major sections

- **Collapsible:** Can be collapsed by clicking the menu icon in the header

- **Mobile-Responsive:** On smaller screens, the sidebar transforms into a hamburger menu



---



## Main Dashboard



The main dashboard is your command center for monitoring Strikebot operations.



### Key Performance Metrics



The top section displays critical metrics as cards:



- **User Growth:** Shows total users and percentage change compared to previous period

- **Transaction Volume:** Displays total transaction amount and percentage change

- **Active Users:** Shows active users count and trend

- **Conversion Rate:** Displays the rate at which users are converting



Each metric card includes:

- Current value

- Percentage change (with up/down indicator)

- Mini trend visualization



### Charts and Graphs



The central section features interactive data visualizations:



- **Bar Graph:** Compares transaction volumes across time periods

  - Hover over bars to see exact values

  - Toggle between daily, weekly, and monthly views



- **Area Graph:** Shows user activity trends over time

  - Use the legend to toggle different data series

  - Drag to zoom into specific time periods



- **Pie Chart:** Visualizes distribution metrics

  - Click on segments to see detailed breakdown

  - Export chart data with the download button



### Recent Activity



The bottom section shows the latest activities:



- Recent user registrations

- Latest transactions

- System notifications

- Important alerts



---



## User Management



### Viewing Users



The Users section provides a comprehensive view of all users in the system.



1. Navigate to **Dashboard > Users** from the sidebar

2. The user table displays with the following columns:

   - User ID

   - Name

   - Email

   - Registration Date

   - Status

   - Actions



**Features:**

- **Search:** Use the search bar to find users by name, email, or ID

- **Filtering:** Filter users by status, date range, or other attributes

- **Pagination:** Navigate between pages of user data



### User Details



To view detailed information about a user:



1. In the Users table, click on the user's **Telegram ID**

2. You will be redirected to the User Detail page at `/dashboard/user-detail?telegramId=[ID]` 

3. The User Detail page displays with the following sections:

   - User Profile Information

   - Referrals made by this user

   - Transactions associated with this user



The user detail page provides a comprehensive view of all user activity in one place, allowing admins to:

- Monitor user engagement

- Track referral performance

- Review transaction history



### Adding New Users



Admins can add new users to the system:



1. Click the "Add User" button in the Users section

2. Fill out the new user form:

   - Name

   - Email

   - Role (Admin/Viewer)

3. Click "Create User" to save



### Editing Users



To modify user information:



1. Find the user in the Users table

2. Click the edit icon in the Actions column

3. Update the user information in the form

4. Click "Save Changes"



### Blocking Users



To block problematic users:



1. Navigate to **Dashboard > Blocked User**

2. Click "Block New User" button

3. Search and select the user to block

4. Provide a reason for blocking

5. Click "Block User"



To unblock a user:

1. Find the user in the Blocked Users list

2. Click "Unblock" in the Actions column

3. Confirm the action



---



## Team Management



### Team Overview



The Teams section allows administrators to manage team structures.



1. Navigate to **Dashboard > Teams** from the sidebar

2. View the list of existing teams with:

   - Team name

   - Member count

   - Actions





   

**Adding members:**

1. Click "Add Members"

2. Search and select users

3. Assign roles within the team

4. Click "Add to Team"



**Removing members:**

1. Find the member in the team members list

2. Click "Remove" button

3. Confirm the action



---



## Transaction Management



### Transaction List



The Transactions section provides detailed information about all financial activities.



1. Navigate to **Dashboard > Transactions**

2. View the transaction table with columns:

   - Transaction ID

   - User

   - Amount

   - Type

   - Status

   - Date

   - Actions



### Transaction Details



To view details of a specific transaction:



1. Click on a transaction ID in the transactions table

2. You will be redirected to **Solscan** in a new browser tab

3. Solscan will display the full transaction history and details on the blockchain

4. You can view:

   - Transaction status and confirmation details

   - Block information

   - Transaction inputs and outputs

   - Associated wallet addresses



### Filtering Transactions



Use the advanced filtering options to find specific transactions:



1. Click "Filters" above the transactions table

2. Set filter criteria:

   - Date range using the date picker

   - Transaction type (deposit, withdrawal, etc.)

   - Amount range

   - Status (completed, pending, failed)

3. Click "Apply Filters" to update the table



Additional options:

- Save filters for future use

- Clear all filters

- Export filtered results



---



## Top Users Section



### Weekly Top Users



The Top Users section highlights the most active and successful users.



1. Navigate to **Dashboard > Top Users**

2. View the leaderboard showing:

   - Rank

   - User name

   - Activity score

   - Total transactions





## Referral Management



### Viewing Referrals



The Referrals section tracks user acquisition through referral links.



1. Navigate to **Dashboard > Referrals**

2. View the referrals table with the following columns:

   - **Referral Code**: The unique code used for referrals

   - **Telegram ID**: Telegram ID of the referral

   - **Owner Telegram ID**: Telegram ID of the referrer

   - **Reward Wallet**: Wallet address where rewards are sent (displayed as shortened address)

   - **Direct Referrals**: Number of direct referrals (clickable link to view details)

   - **Indirect Referrals**: Number of indirect referrals (clickable link to view details)

   - **Commission Rate**: Custom commission percentage (if available) or default rate

   - **Actions**: Options to edit referral details





## Winners Management



### Weekly Pools and Approval Process



The Winners Management section handles the approval process for weekly competition winners:



1. Navigate to **Dashboard > Winners**

2. View the list of weekly pools that are pending approval

3. Each pool entry includes:

   - Weekly pool details

   - Potential winners

   - Prize amounts

   - Status (pending approval)



### Winner Approval Process



To approve or reject winners:



1. Click on a weekly pool entry from the list

2. You will be redirected to a detailed approval page where you can:

   - Review the automatically selected winners

   - Approve winners to confirm selections

   - Reject individual winners (system will automatically suggest replacement candidates)

   - View prize distributions based on ranking (1st, 2nd, 3rd place)



3. Once you submit your decision:

   - Approved winners will be added to the winners table

   - Prize distribution will be recorded



### Winners List



After approval, winners can be viewed in the Winners table:

- Winner details (Telegram ID, username)

- Prize amount

- Placement (1st, 2nd, 3rd)

- Award date



---



## Settings



### Referral Commission Settings



Manage the default referral commission settings for the platform:



1. Navigate to **Dashboard > Settings**

2. In the Referral Settings section:

   - View the current default commission rate

   - Use the toggle switch to enable/disable default commission for all users

   - Update the default commission percentage that applies to new users



### Winner Prize Settings



Configure the prize distribution for weekly winners:



1. In the Winner Settings section:

   - Set percentage prize for 1st place winners

   - Set percentage prize for 2nd place winners

   - Set percentage prize for 3rd place winners

   - Save changes to apply new prize distribution



### Admin Wallet Balance



View and manage the admin wallet:



1. In the Wallet section:

   - Check the current admin wallet balance



---



## Advanced Features



### Role-Based Access Control



The Strikebot Dashboard implements a strict role-based access control system:



1. **Initial Access**:

   - Initially, only users with the **admin** role can access the dashboard

   - Other users will see an "Access Denied" message when attempting to log in



2. **Role Management**:

   - Admins can add additional users with different roles:

     - **Admin**: Full access to all dashboard features

     - **Viewer**: Limited access to view data without modification capabilities



3. **Managing Users and Roles**:

   - Navigate to **Dashboard > Teams**

   - Add new admin users or viewers

   - Remove users from teams when access is no longer needed







*This walkthrough document is regularly updated to reflect the latest features and improvements to the Strikebot Dashboard.*



*Last updated: May 15, 2025*