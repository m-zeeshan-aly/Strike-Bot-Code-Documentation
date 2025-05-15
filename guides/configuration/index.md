# Configuration Guide

This guide provides comprehensive instructions for configuring the Strikebot Dashboard after installation. Proper configuration is essential for optimal dashboard performance and functionality.

## Environment Variables

The Strikebot Dashboard uses environment variables for configuration. These are stored in a `.env` file in the root directory of the project. Below is a detailed explanation of each environment variable:

### Database Configuration

```properties
# PostgreSQL connection string (using Neon DB in this example)
DATABASE_URL="postgresql://username:password@host:port/database?sslmode=require"
```

- **DATABASE_URL**: The connection string for your PostgreSQL database. This should include your username, password, host, port, and database name.

### MongoDB Configuration (Optional)

```properties
# MongoDB Configuration (for specific features)
MONGODB_URI="mongodb+srv://username:password@cluster.mongodb.net/database"
MONGODB_DB="database_name"
```

- **MONGODB_URI**: The connection string for your MongoDB database.
- **MONGODB_DB**: The name of your MongoDB database.

### NextAuth Configuration

```properties
# The base URL of your website
NEXTAUTH_URL="http://localhost:3000"
# A secret key for NextAuth.js
NEXTAUTH_SECRET="your-secure-random-string"
# Set to true to enable NextAuth.js debugging
NEXTAUTH_DEBUG=false
# Email address that will be granted admin privileges
ADMIN_EMAIL="admin@example.com"
```

- **NEXTAUTH_URL**: The base URL of your website. In development, this is typically `http://localhost:3000`.
- **NEXTAUTH_SECRET**: A secure random string used to encrypt cookies and tokens. Generate this using `openssl rand -base64 32`.
- **NEXTAUTH_DEBUG**: Set to `true` to enable NextAuth.js debugging.
- **ADMIN_EMAIL**: The email address that will be granted admin privileges. This user will have access to all dashboard features.

### Email Server Configuration

```properties
# SMTP server credentials
EMAIL_SERVER_USER="your-email@example.com"
EMAIL_SERVER_PASSWORD="your-email-password"
EMAIL_SERVER_HOST="smtp.example.com"
EMAIL_SERVER_PORT=465  # Typically 465 for SSL or 587 for TLS
EMAIL_FROM="noreply@example.com"  # The sender address shown in emails
```

- **EMAIL_SERVER_USER**: The username for your SMTP server.
- **EMAIL_SERVER_PASSWORD**: The password for your SMTP server.
- **EMAIL_SERVER_HOST**: The hostname of your SMTP server.
- **EMAIL_SERVER_PORT**: The port of your SMTP server. Typically 465 for SSL or 587 for TLS.
- **EMAIL_FROM**: The email address that will appear as the sender in emails sent by the system.

### File Upload Configuration

```properties
# Uploadthing configuration
UPLOADTHING_SECRET="your-uploadthing-secret-key"
UPLOADTHING_APP_ID="your-uploadthing-app-id"
```

- **UPLOADTHING_SECRET**: Your Uploadthing secret key.
- **UPLOADTHING_APP_ID**: Your Uploadthing app ID.

### API Proxy Settings

```properties
# API Proxy Settings
API_BASE_URL="https://api.example.com"
API_KEY="your-api-key"
```

- **API_BASE_URL**: The base URL for API proxy requests.
- **API_KEY**: The API key for authenticated requests.

## Role-Based Access Control

The Strikebot Dashboard implements role-based access control with two primary roles:

1. **Admin**: Has full access to all dashboard features and functionalities.
2. **Viewer**: Has limited access to dashboard features.

### Admin Role

Admins have access to:
- User management (create, update, delete)
- Team management
- System settings
- All data visualizations
- All reports and analytics
- Transaction management
- Winner management

### Viewer Role

Viewers have access to:
- Main dashboard page
- Basic data visualizations
- Limited reports and analytics
- Read-only access to user data

### Assigning Roles

The initial admin user is determined by the `ADMIN_EMAIL` environment variable. All other users will be assigned the Viewer role by default. Admin users can promote other users to the Admin role through the user management interface.

## Feature Configuration

### Email Authentication

Email authentication is enabled by default and configured using the Email Server Configuration environment variables. This allows users to sign in using their email address and a magic link.

### File Uploads

File uploads are handled by Uploadthing and configured using the File Upload Configuration environment variables. This allows users to upload files such as profile pictures, documents, etc.

### API Proxy

The API proxy is configured using the API Proxy Settings environment variables. This allows the dashboard to make requests to external APIs without exposing sensitive credentials to the client.

## Advanced Configuration

### Custom Styles

You can customize the appearance of the dashboard by modifying the Tailwind configuration in `tailwind.config.js`. This allows you to change colors, fonts, and other design elements to match your brand.

### Authentication Timeouts

By default, JWT sessions expire after 1 hour. You can modify this by updating the `session.maxAge` property in the NextAuth configuration in `auth.ts`.

### Database Optimization

For production deployments, it's recommended to optimize your database for performance. This includes creating appropriate indexes, optimizing queries, and configuring connection pooling.

## Troubleshooting

If you encounter issues with your configuration, check the following:

- Ensure all required environment variables are correctly set in your `.env` file.
- Check that your database connection strings are correct and that your databases are accessible.
- Verify that your SMTP server is correctly configured and accessible.
- Check the application logs for any error messages related to configuration.

For more detailed troubleshooting, consult the [Troubleshooting Guide](../troubleshooting/index.md).
