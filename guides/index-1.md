# Installation Guide

This guide provides comprehensive instructions for setting up the Strikebot Dashboard application from scratch. Follow these step-by-step instructions to get your development environment up and running.

## Prerequisites

Before you begin installation, ensure that you have the following prerequisites installed on your system:

| Prerequisite                   | Minimum Version | Recommended Version | Purpose            |
| ------------------------------ | --------------- | ------------------- | ------------------ |
| [Node.js](https://nodejs.org/) | v16.x           | v18.x or later      | JavaScript runtime |
| [npm](https://www.npmjs.com/)  | v7.x            | v8.x or later       | Package manager    |
| [Git](https://git-scm.com/)    | v2.x            | v2.30.0 or later    | Version control    |

You will also need access to:

* A PostgreSQL database (such as [Neon DB](https://neon.tech/))
* An SMTP server for email authentication
* (Optional) A MongoDB database for specific features

## Step 1: Clone the Repository

First, clone the repository to your local machine:

```bash
# Clone the repository
git clone <repository-url>

# Navigate to the project directory
cd strikebot-dashboard
```

## Step 2: Install Dependencies

Install all required dependencies using npm:

```bash
# Install dependencies
npm install
```

This command will install all dependencies listed in the `package.json` file.

## Step 3: Configure Environment Variables

Create a `.env` file in the root directory of the project:

```bash
# Create and open .env file
cp env.example.txt .env
```

Edit the `.env` file and add the following variables with your specific values:

```properties
# Database Configuration
# PostgreSQL connection string (using Neon DB in this example)
DATABASE_URL="postgresql://username:password@host:port/database?sslmode=require"

# MongoDB Configuration (Optional, for specific features)
MONGODB_URI="mongodb+srv://username:password@cluster.mongodb.net/database"
MONGODB_DB="database_name"

# NextAuth Configuration
# The base URL of your website
NEXTAUTH_URL="http://localhost:3000"
# A secret key for NextAuth.js (Generate with: openssl rand -base64 32)
NEXTAUTH_SECRET="your-secure-random-string"
# Set to true to enable NextAuth.js debugging
NEXTAUTH_DEBUG=false
# Email address that will be granted admin privileges
ADMIN_EMAIL="admin@example.com"

# Email Server Configuration (for magic link authentication)
# SMTP server credentials
EMAIL_SERVER_USER="your-email@example.com"
EMAIL_SERVER_PASSWORD="your-email-password"
EMAIL_SERVER_HOST="smtp.example.com"
EMAIL_SERVER_PORT=465  # Typically 465 for SSL or 587 for TLS
EMAIL_FROM="noreply@example.com"  # The sender address shown in emails

# File Upload Configuration (Uploadthing)
UPLOADTHING_SECRET="your-uploadthing-secret-key"
UPLOADTHING_APP_ID="your-uploadthing-app-id"

# API Proxy Settings (Optional)
# Base URL for API proxy requests
API_BASE_URL="https://api.example.com"
# API key for authenticated requests
API_KEY="your-api-key"
```

### Generate NextAuth Secret

You can generate a secure random string for `NEXTAUTH_SECRET` using the following command:

```bash
# For Linux/macOS
openssl rand -base64 32

# For Windows PowerShell
$bytes = New-Object byte[] 32
$rand = [System.Security.Cryptography.RandomNumberGenerator]::Create()
$rand.GetBytes($bytes)
[System.Convert]::ToBase64String($bytes)
```

## Step 4: Set Up the Database

### PostgreSQL Setup

1. Create a PostgreSQL database (can be hosted on Neon DB, Supabase, Railway, etc.)
2. Update the `DATABASE_URL` in your `.env` file with your database connection string
3. Generate the Prisma client:

```bash
npx prisma generate
```

4. Run the database migrations to create the schema:

```bash
npx prisma migrate deploy
```

### (Optional) Seed the Database

If you want to populate the database with initial data for development:

```bash
# Uncomment and run if seed script is available
# npx prisma db seed
```

### (Optional) MongoDB Setup

If you're using MongoDB for certain features:

1. Create a MongoDB database (can be MongoDB Atlas or self-hosted)
2. Add your MongoDB connection string to the `.env` file as shown in Step 3

## Step 5: (Optional) File Upload Setup

For file upload functionality:

1. Create an account at [Uploadthing](https://uploadthing.com)
2. Create a new app and get your API keys
3. Add your API keys to the `.env` file as shown in Step 3

## Step 6: Run the Development Server

Start the development server:

```bash
npm run dev
```

This will start the Next.js development server. By default, the application will be available at [http://localhost:3000](http://localhost:3000).

## Step 7: Access the Dashboard

1. Navigate to [http://localhost:3000](http://localhost:3000) in your browser
2. Click "Sign In" and enter the email you specified as `ADMIN_EMAIL` in your `.env` file
3. Check your email for a magic link and click it to sign in
4. You should now have access to the dashboard with admin privileges

## Troubleshooting

### Database Connection Issues

If you encounter database connection issues:

1. Verify your `DATABASE_URL` is correct
2. Ensure your database server is running
3. Check for network restrictions or firewall issues
4. Verify that your database user has the necessary permissions

```bash
# Test PostgreSQL connection
npx prisma db pull
```

### Email Authentication Issues

If magic links aren't working:

1. Verify your SMTP server credentials
2. Check your email spam/junk folder
3. Ensure `NEXTAUTH_URL` is set correctly
4. Check the server logs for error messages

### Build Errors

If you encounter build errors:

1. Ensure all dependencies are installed properly
2. Clear the Next.js cache:

```bash
# Clear Next.js cache
rm -rf .next
```

3. Verify your Node.js version:

```bash
node --version
```

4. Check for TypeScript errors:

```bash
npm run type-check
```

## Next Steps

After successful installation, you might want to:

1. [Configure the application](index-3.md) according to your requirements
2. [Customize the dashboard](customization/index.md) with your branding
3. [Deploy the application](deployment/index.md) to a production environment

## Additional Resources

* [Database Management](guides/database-management.md)
* [Authentication Configuration](guides/authentication.md)
* [User Management](guides/user-management.md)
