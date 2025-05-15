# Architecture

This section provides a comprehensive overview of the Strikebot Dashboard's architecture, including project structure, code organization, and system design.

## Project Structure

The Strikebot Dashboard follows a standard Next.js 14 project structure with the app router, organized in a modular and maintainable way:

```
├── app/                   # Next.js app router directory
│   ├── (auth)/            # Authentication related routes
│       └── (signin)/      # Sign-in related pages
│   ├── api/               # API endpoints
│       ├── auth/          # Authentication endpoints
│       ├── proxy/         # Proxy API endpoints
│       └── teams/         # Team management endpoints
│   ├── dashboard/         # Dashboard pages
│       ├── blocked-user/  # Blocked users management
│       ├── referrals/     # Referral management
│       ├── settings/      # Settings pages
│       ├── teams/         # Team management
│       ├── top-users/     # Top users display
│       ├── transactions/  # Transaction management
│       ├── user-detail/   # User details view
│       ├── users/         # User management
│       ├── winners/       # Winner management
│       ├── layout.tsx     # Dashboard layout
│       ├── page.tsx       # Main dashboard page
│       └── types.ts       # Dashboard related types
│   ├── favicon.ico        # Site favicon
│   ├── globals.css        # Global CSS
│   ├── layout.tsx         # Root layout
│   └── not-found.tsx      # 404 page
├── components/            # UI components
│   ├── charts/            # Chart components for data visualization
│       ├── area-graph.tsx # Area chart component
│       ├── bar-graph.tsx  # Bar chart component
│       └── pie-graph.tsx  # Pie chart component
│   ├── filters/           # Filter components
│   ├── forms/             # Form components
│       ├── user-auth-form.tsx         # Authentication form
│       ├── new-user-form.tsx          # New user creation form
│       └── user-profile-stepper/      # Multi-step profile form
│   ├── kanban/            # Kanban board components
│       ├── board-column.tsx           # Kanban column
│       ├── task-card.tsx              # Task card component
│       └── kanban-board.tsx           # Main board component
│   ├── layout/            # Layout components
│       ├── header.tsx                 # Page header
│       ├── sidebar.tsx                # Navigation sidebar
│       ├── mobile-sidebar.tsx         # Mobile navigation
│       ├── page-container.tsx         # Page wrapper
│       ├── providers.tsx              # Context providers
│       ├── user-nav.tsx               # User navigation
│       └── ThemeToggle/               # Theme toggle component
│   ├── modal/             # Modal components
│   ├── sections/          # Page section components
│   ├── tables/            # Table components for data display
│       ├── blockedUsers/              # Blocked users table
│       ├── referrals/                 # Referrals table
│       ├── teams/                     # Teams table
│       ├── transactions/              # Transactions table
│       ├── users/                     # Users table
│       └── winners/                   # Winners table
│   └── ui/                # UI components built with shadcn
│       ├── button.tsx                 # Button component
│       ├── card.tsx                   # Card component
│       ├── data-table.tsx             # Data table component
│       ├── form.tsx                   # Form component
│       └── ...                        # Other UI components
├── constants/             # Application constants
├── data/                  # Static data and mock data
├── hooks/                 # Custom React hooks
│   ├── useFetchData.tsx              # Data fetching hook
│   ├── useMultistepForm.tsx          # Multi-step form hook
│   └── useSidebar.tsx                # Sidebar state hook
├── lib/                   # Utility functions and libraries
│   ├── authenticated.ts              # Authentication utilities
│   ├── form-schema.ts                # Form validation schemas
│   ├── mongodb.ts                    # MongoDB connection
│   ├── store.ts                      # State management store
│   └── utils.ts                      # General utilities
├── prisma/                # Prisma schema and migrations
│   ├── schema.prisma                 # Database schema
│   └── migrations/                   # Database migrations
├── public/                # Static assets
├── types/                 # TypeScript type definitions
├── utils/                 # Utility functions
├── auth.ts                # NextAuth configuration
├── middleware.ts          # NextAuth middleware for route protection
├── prisma.ts              # Prisma client instance
├── next.config.js         # Next.js configuration
├── tailwind.config.js     # Tailwind CSS configuration
├── package.json           # Project dependencies and scripts
└── README.md              # Project documentation
```

## Architectural Patterns

The Strikebot Dashboard leverages several architectural patterns to ensure maintainability, scalability, and performance:

### Component-Based Architecture

The frontend is built using a component-based architecture, where UI elements are broken down into reusable components. This promotes:

- **Reusability** - Components can be used across different parts of the application
- **Maintainability** - Changes to a component are reflected everywhere it's used
- **Testing** - Components can be tested in isolation
- **Collaboration** - Team members can work on different components simultaneously

### Server-Side Rendering (SSR)

The application uses Next.js's server-side rendering capabilities for:

- **Improved SEO** - Search engines can index content more effectively
- **Faster Initial Load** - Users see content sooner
- **Reduced Client-Side JavaScript** - Less JavaScript to parse and execute
- **Better Performance on Low-End Devices** - Less client-side processing required

### API Routes

The application uses Next.js API routes to create serverless functions that handle:

- **Authentication** - User sign-in and session management
- **Data Fetching** - Retrieving data from databases
- **Data Mutation** - Creating, updating, and deleting data
- **Proxy Requests** - Forwarding requests to external APIs

### Middleware

Next.js middleware is used for:

- **Authentication** - Protecting routes based on user sessions
- **Authorization** - Checking user permissions for specific routes
- **Redirects** - Handling redirects for unauthenticated users
- **Headers** - Adding security headers to responses

## Data Flow

The data flow in the Strikebot Dashboard follows a clear pattern:

1. **Client Request** - User interacts with the UI (e.g., clicking a button)
2. **Client-Side Validation** - Form inputs are validated on the client
3. **API Request** - Data is sent to the appropriate API route
4. **Server-Side Validation** - Data is validated again on the server
5. **Database Operation** - Data is retrieved from or saved to the database
6. **Response** - Results are sent back to the client
7. **UI Update** - The UI is updated to reflect the changes

## Database Design

### Primary Database (PostgreSQL)

The PostgreSQL database schema includes the following core tables:

- **Users** - User accounts with roles and profile information
- **Accounts** - Connected authentication accounts
- **Sessions** - User session data
- **VerificationToken** - Tokens for email verification
- **Teams** - Team information and membership
- **Transactions** - Transaction records and details
- **Referrals** - Referral tracking and relationships
- **Winners** - Contest winners and prize information

### Entity Relationship Diagram (ERD)

```
┌─────────────┐       ┌─────────────┐       ┌─────────────┐
│    User     │       │   Account   │       │   Session   │
├─────────────┤       ├─────────────┤       ├─────────────┤
│ id          │◄──┐   │ id          │       │ id          │
│ name        │   └───┤ userId      │       │ userId      │◄───┐
│ email       │       │ provider    │       │ expires     │    │
│ image       │       │ type        │       │ sessionToken│    │
│ role        │       └─────────────┘       └─────────────┘    │
│ createdAt   │                                                 │
│ updatedAt   │◄─────────────────────────────────────────────┐ │
└─────────────┘                                              │ │
       ▲                                                     │ │
       │                                                     │ │
       │                                                     │ │
┌─────────────┐       ┌─────────────┐       ┌─────────────┐ │ │
│    Team     │       │ Transaction │       │  Referral   │ │ │
├─────────────┤       ├─────────────┤       ├─────────────┤ │ │
│ id          │       │ id          │       │ id          │ │ │
│ name        │       │ userId      │◄──────┤ userId      │◄┘ │
│ description │       │ amount      │       │ referredId  │◄──┘
│ createdAt   │       │ type        │       │ code        │
│ updatedAt   │       │ status      │       │ createdAt   │
└─────────────┘       │ createdAt   │       └─────────────┘
       ▲              └─────────────┘
       │
┌─────────────┐
│ TeamMember  │
├─────────────┤
│ id          │
│ teamId      │◄──┐
│ userId      │◄──┼───────────────────────────────────────────┘
│ role        │   │
└─────────────┘   │
                  │
┌─────────────┐   │
│   Winner    │   │
├─────────────┤   │
│ id          │   │
│ userId      │◄──┘
│ prize       │
│ contest     │
│ createdAt   │
└─────────────┘
```

### Secondary Database (MongoDB)

The MongoDB database is used for specific features requiring more flexible schema designs, such as:

- **Analytics Data** - Time-series data for dashboard analytics
- **User Activity Logs** - Detailed user activity tracking
- **Feature-specific Data** - Data with evolving schemas

## Authentication Flow

The authentication flow using NextAuth.js works as follows:

1. **User Visits Sign-in Page** - User navigates to the sign-in page
2. **Email Entry** - User enters their email address
3. **Magic Link Email** - System sends a magic link to the user's email
4. **Email Verification** - User clicks the magic link in their email
5. **Session Creation** - System creates a session for the user
6. **Role Assignment** - System assigns appropriate role based on email
7. **Redirect to Dashboard** - User is redirected to the dashboard

## Authorization Model

The application uses a role-based access control (RBAC) system:

- **Admin** - Full access to all dashboard features and data
- **Viewer** - Read-only access to selected dashboard views

Authorization is enforced through:

1. **Middleware** - Checks user roles before allowing access to protected routes
2. **API Routes** - Verifies permissions before performing operations
3. **UI Conditionals** - Hides or disables features based on user role
4. **Server Components** - Renders different content based on user role

## Deployment Architecture

The application is designed for deployment on modern hosting platforms with serverless capabilities:

```
┌─────────────────────────────────────────────────────────────┐
│                      CDN (Vercel Edge)                      │
└─────────────────────────────────────────────────────────────┘
                               ▲
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│                    Next.js Application                      │
├─────────────────┬───────────────────────┬───────────────────┤
│  Static Assets  │   Server Components   │    API Routes     │
└─────────────────┴───────────────────────┴───────────────────┘
                               ▲
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│                    Database Services                        │
├─────────────────────────────┬───────────────────────────────┤
│      PostgreSQL (Neon)      │        MongoDB Atlas          │
└─────────────────────────────┴───────────────────────────────┘
```

Key deployment considerations:

- **Edge Functions** - API routes deployed as edge functions for global performance
- **Asset Optimization** - Static assets optimized and served from CDN
- **Database Proximity** - Databases located in regions close to the majority of users
- **Serverless Scaling** - Automatic scaling based on demand
- **Zero Downtime Deployments** - Rolling updates without service interruption
