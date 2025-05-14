# Codebase Documentation for StrikeBot Dashboard## Overview
The StrikeBot Dashboard is a web application built using Next.js. It serves as an administrative interface for managing and monitoring various aspects of the StrikeBot platform, including user management, transactions, referrals, and more. The application is designed to be modular, scalable, and easy to maintain.---## Table of Contents1. [Folder Structure](#folder-structure)
2. [Key Features](#key-features)
3. [Environment Variables](#environment-variables)
4. [Development Setup](#development-setup)
5. [API Routes](#api-routes)
6. [Troubleshooting](#troubleshooting)---## Folder Structure### **`app/`**
This folder contains the main application pages and API routes.
- **`dashboard/`**: Contains all dashboard-related pages, such as:
  - **`blocked-user/`**: Manage blocked users.
  - **`referrals/`**: Manage referral data.
  - **`settings/`**: Configure application settings.
  - **`teams/`**: Manage team-related data.
  - **`top-users/`**: View and approve weekly top users.
  - **`transactions/`**: Track user transactions.
  - **`user-detail/`**: View detailed user information.
  - **`users/`**: Manage user accounts.
  - **`winners/`**: Manage weekly winners.
- **`api/`**: Contains server-side API routes for handling backend logic.
  - **`auth/`**: Authentication-related API routes.
  - **`proxy/`**: Proxy routes for backend API communication.
  - **`teams/`**: API routes for team-related operations.
- **`auth/`**: Handles authentication-related pages like sign-in and sign-out.### **`components/`**
Reusable UI components for building the application.
- **`breadcrumbs.tsx`**: Component for rendering breadcrumb navigation.
- **`dashboard-nav.tsx`**: Navigation component for the dashboard.
- **`date-range-picker.tsx`**: Component for selecting date ranges.
- **`icons.tsx`**: Contains reusable SVG icons.
- **`overview.tsx`**: Displays an overview of key metrics.
- **`recent-sales.tsx`**: Component for showing recent sales data.
- **`charts/`**: Components for rendering graphs and charts.
  - **`area-graph.tsx`**: Area chart component.
  - **`bar-graph.tsx`**: Bar chart component.
  - **`pie-graph.tsx`**: Pie chart component.
- **`filters/`**: Components for filtering data.
  - **`Filters.tsx`**: Main filtering component.
- **`forms/`**: Components for handling forms.
  - **`new-ad-form.tsx`**: Form for creating new ads.
  - **`new-trending-form.tsx`**: Form for creating trending items.
  - **`new-user-form.tsx`**: Form for creating new users.
  - **`update-trending-form.tsx`**: Form for updating trending items.
  - **`user-auth-form.tsx`**: Form for user authentication.
  - **`user-profile-stepper/`**: Multi-step form for user profiles.
- **`kanban/`**: Components for Kanban board functionality.
  - **`board-column.tsx`**: Represents a column in the Kanban board.
  - **`column-action.tsx`**: Actions for Kanban columns.
  - **`kanban-board.tsx`**: Main Kanban board component.
  - **`new-section-dialog.tsx`**: Dialog for creating new sections.
  - **`new-task-dialog.tsx`**: Dialog for creating new tasks.
  - **`task-card.tsx`**: Represents a task card in the Kanban board.
- **`layout/`**: Components for the application layout.
  - **`header.tsx`**: Header component.
  - **`mobile-sidebar.tsx`**: Sidebar for mobile devices.
  - **`page-container.tsx`**: Wrapper for page content.
  - **`providers.tsx`**: Context providers for the application.
  - **`sidebar.tsx`**: Sidebar navigation component.
  - **`user-nav.tsx`**: User navigation menu.
  - **`ThemeToggle/`**: Theme toggle component.
- **`modal/`**: Components for modals.
  - **`alert-modal.tsx`**: Modal for alerts.
- **`sections/`**: Specific sections for pages.
  - **`userDetailHeader.tsx`**: Header for user detail pages.
- **`tables/`**: Components for rendering data tables.
  - **`table.tsx`**: Generic table component.
  - **`blockedUsers/`**: Table for blocked users.
  - **`referrals/`**: Table for referrals.
  - **`teams/`**: Table for teams.
  - **`transactions/`**: Table for transactions.
  - **`users/`**: Table for users.
  - **`weeklyTopUsers/`**: Table for weekly top users.
  - **`winners/`**: Table for winners.
- **`ui/`**: General-purpose UI components.
  - **`accordion.tsx`**: Accordion component.
  - **`alert-dialog.tsx`**: Alert dialog component.
  - **`alert.tsx`**: Alert component.
  - **`avatar.tsx`**: Avatar component.
  - **`badge.tsx`**: Badge component.
  - **`breadcrumb.tsx`**: Breadcrumb component.
  - **`button.tsx`**: Button component.
  - **`calendar.tsx`**: Calendar component.
  - **`card.tsx`**: Card component.
  - **`chart.tsx`**: Chart wrapper component.
  - **`checkbox.tsx`**: Checkbox component.
  - **`collapsible.tsx`**: Collapsible component.
  - **`data-table.tsx`**: Data table component.
  - **`dialog.tsx`**: Dialog component.
  - **`dropdown-menu.tsx`**: Dropdown menu component.
  - **`form.tsx`**: Form wrapper component.
  - **`heading.tsx`**: Heading component.
  - **`input.tsx`**: Input field component.
  - **`label.tsx`**: Label component.
  - **`loading-spinner.tsx`**: Loading spinner component.
  - **`modal.tsx`**: Modal wrapper component.
  - **`popover.tsx`**: Popover component.
  - **`scroll-area.tsx`**: Scrollable area component.### **`constants/`**
Contains static data and constants used across the application.
- **`data.ts`**: Static data for dropdowns, filters, etc.### **`data/`**
Stores mock data or static JSON files for testing and development purposes.### **`hooks/`**
Custom React hooks for managing state and logic.
- **`useFetchData.tsx`**: Hook for fetching data from APIs.
- **`useMultistepForm.tsx`**: Hook for managing multi-step forms.
- **`useSidebar.tsx`**: Hook for managing sidebar state.### **`lib/`**
Utility functions and libraries for authentication, database connections, and more.
- **`authenticated.ts`**: Handles user authentication.
- **`form-schema.ts`**: Validation schema for forms.
- **`mongodb.ts`**: MongoDB connection utility.
- **`store.ts`**: State management store.
- **`utils.ts`**: General utility functions.### **`prisma/`**
Database schema and migration files for Prisma ORM.
- **`schema.prisma`**: Defines the database schema.
- **`migrations/`**: Contains migration files for database changes.### **`public/`**
Static assets like images, icons, and other publicly accessible files.
- **`lightning.svg`**: Lightning icon.
- **`logo_main.webp`**: Main logo.
- **`next.svg`**: Next.js logo.
- **`vercel.svg`**: Vercel logo.### **`types/`**
TypeScript type definitions for the application.
- **`index.ts`**: Centralized type definitions.### **`utils/`**
Utility functions for handling specific features like ads, stats, and user-related operations.
- **`Ads.ts`**: Functions for managing ads.
- **`Stats.ts`**: Functions for calculating statistics.
- **`trending.ts`**: Functions for managing trending items.
- **`Users.ts`**: Functions for managing user data.---## Key Features### **Authentication**
- Managed using `next-auth`.
- Environment variables like `NEXTAUTH_URL` and `NEXTAUTH_SECRET` are configured in `.env`.### **Database**
- Uses Prisma ORM with a PostgreSQL database.
- Connection string is defined in `DATABASE_URL`.### **API Routes**
- Located in `app/api/`.
- Example: `/api/proxy/referrals/get-all-referrals` fetches referral data.### **UI Components**
- Built with reusable components in `components/ui/`.
- Example: `Button`, `Input`, `Modal`.### **State Management**
- Uses React's `useState` and `useEffect` hooks.
- Custom hooks like `useFetchData` are used for data fetching.### **Styling**
- Tailwind CSS is used for styling.
- Configuration is in `tailwind.config.js`.---## Environment Variables### **Authentication**
- `NEXTAUTH_URL`: Base URL for authentication.
- `NEXTAUTH_SECRET`: Secret key for NextAuth.### **Database**
- `DATABASE_URL`: Connection string for the PostgreSQL database.### **API**
- `BASE_URL`: Base URL for the backend API.
- `BEARER_TOKEN`: Token for API authentication.### **Frontend**
- `NEXT_PUBLIC_APP_URL`: Base URL for the frontend application.---## Development Setup### **Prerequisites**
- Node.js (v16 or later)
- PostgreSQL database### **Steps**
1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Set up the `.env` file with the required environment variables.
4. Run the development server:
   ```bash
   npm run dev
   ```
5. Access the application at `http://localhost:3000`.---## Troubleshooting### **Common Issues**
1. **Environment Variables Not Set**:
   - Ensure all required variables are present in the `.env` file.2. **Database Connection Issues**:
   - Verify the `DATABASE_URL` is correct and the database is running.3. **API Errors**:
   - Check the `BASE_URL` and `BEARER_TOKEN` values.4. **Styling Issues**:
   - Ensure Tailwind CSS is properly configured and the `globals.css` file is imported.---For further assistance, refer to the README file or contact the development team.
6:40
# Dashboard Usage Documentation for StrikeBot## Overview
The StrikeBot Dashboard is an administrative interface designed to manage and monitor various aspects of the StrikeBot platform. It provides tools for managing users, tracking transactions, handling referrals, approving top users, and configuring settings. This document provides a detailed guide for using each functionality and page of the dashboard.---## Pages and Functionalities### **1. Dashboard Overview**
- **Path**: `/dashboard`
- **Description**: The main landing page of the dashboard, providing a high-level overview of key metrics and recent activities.
- **Features**:
  - **Recent Sales**: Displays a list of recent transactions.
  - **Graphs and Charts**: Visualize data trends using area, bar, and pie charts.
  - **Quick Links**: Navigate to key sections like users, referrals, and transactions.---### **2. Referrals Management**
- **Path**: `/dashboard/referrals`
- **Description**: Manage and track referral activities.
- **Features**:
  - **View Referrals**: Displays a table of all referrals with details like referral code, owner username, total rewards, and more.
  - **Search by Telegram ID**: Use the search bar to filter referrals by `telegramId`.
    - Example: `/dashboard/referrals?telegramId=123456789`
  - **Pagination**: Navigate through pages of referral data.
  - **Columns**:
    - Referral Code
    - Owner Username
    - Total Rewards (Paid/Unpaid)
    - Direct and Indirect Referrals
    - Custom Commission Rate---### **3. Transactions Management**
- **Path**: `/dashboard/transactions`
- **Description**: Track and manage all user transactions.
- **Features**:
  - **View Transactions**: Displays a table of transactions with details like amount, transaction fee, type, and recipient Telegram ID.
  - **Filters**:
    - **Date Range**: Filter transactions by start and end dates.
    - **Transaction Type**: Filter by type (e.g., deposit, withdrawal).
  - **Search by Telegram ID**: Use the search bar to filter transactions by `telegramId`.
  - **Pagination**: Navigate through pages of transaction data.
  - **Columns**:
    - Transaction ID
    - Date
    - Amount
    - Transaction Fee
    - Platform Fee
    - Type
    - Recipient Telegram ID---### **4. Users Management**
- **Path**: `/dashboard/users`
- **Description**: Manage user accounts and their statuses.
- **Features**:
  - **View Users**: Displays a table of all users with details like username, email, and status.
  - **Block/Unblock Users**: Change the status of a user to block or unblock them.
  - **Search by Username or Email**: Use the search bar to filter users.
  - **Pagination**: Navigate through pages of user data.
  - **Columns**:
    - Username
    - Email
    - Status (Active/Blocked)
    - Actions (Block/Unblock)---### **5. Top Users Management**
- **Path**: `/dashboard/top-users`
- **Description**: View and approve weekly top users.
- **Features**:
  - **View Weekly Winners**: Displays a list of top users for the week.
  - **Approve Winners**: Approve users as weekly winners.
  - **Search by Username or Telegram ID**: Use the search bar to filter top users.
  - **Pagination**: Navigate through pages of top user data.
  - **Columns**:
    - Username
    - Telegram ID
    - Total Amount
    - Position
    - Actions (Approve/Reject)---### **6. Blocked Users Management**
- **Path**: `/dashboard/blocked-user`
- **Description**: Manage users who have been blocked from the platform.
- **Features**:
  - **View Blocked Users**: Displays a table of blocked users with details like username, reason for blocking, and date of blocking.
  - **Unblock Users**: Remove a user from the blocked list.
  - **Search by Username or Telegram ID**: Use the search bar to filter blocked users.
  - **Pagination**: Navigate through pages of blocked user data.
  - **Columns**:
    - Username
    - Telegram ID
    - Reason for Blocking
    - Date of Blocking
    - Actions (Unblock)---### **7. Winners Management**
- **Path**: `/dashboard/winners`
- **Description**: Manage and view approved weekly winners.
- **Features**:
  - **View Winners**: Displays a list of approved weekly winners.
  - **Search by Username or Telegram ID**: Use the search bar to filter winners.
  - **Pagination**: Navigate through pages of winner data.
  - **Columns**:
    - Username
    - Telegram ID
    - Week Start Date
    - Week End Date
    - Total Amount---### **8. Settings**
- **Path**: `/dashboard/settings`
- **Description**: Configure application settings.
- **Features**:
  - **Update Profile**: Change admin profile details like name and email.
  - **Change Password**: Update the admin password.
  - **Application Settings**: Configure global settings for the platform.---## Common Features Across Pages### **Search**
- Use the search bar to filter data by specific fields (e.g., `telegramId`, username).
- Example: `/dashboard/referrals?telegramId=123456789`### **Pagination**
- Navigate through pages of data using the pagination controls at the bottom of tables.### **Filters**
- Apply filters like date range, status, or type to refine data.### **Modals**
- Perform actions like editing or deleting records using modals.---## Troubleshooting### **Common Issues**
1. **Data Not Loading**:
   - Ensure the backend API is running and accessible.
   - Verify the `BASE_URL` and `BEARER_TOKEN` in the `.env` file.2. **Search Not Working**:
   - Check if the search parameter matches the column's accessor key.
   - Verify the backend API supports filtering by the search parameter.3. **Pagination Issues**:
   - Ensure the `page` and `limit` query parameters are correctly passed to the API.4. **Styling Issues**:
   - Ensure Tailwind CSS is properly configured and the `globals.css` file is imported.---For further assistance, refer to the `CODEBASE_DOCUMENTATION.md` file or contact the development team.