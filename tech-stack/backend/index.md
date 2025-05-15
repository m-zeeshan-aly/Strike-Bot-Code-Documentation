# Backend & Services

The Strikebot Dashboard uses various backend technologies and services to provide a robust and secure admin experience.

## Authentication: NextAuth.js

[NextAuth.js](https://next-auth.js.org/) (now Auth.js) provides the authentication system for the Strikebot Dashboard.

### Implementation Details

The dashboard uses email-based authentication with magic links:

```typescript
// auth.ts configuration highlights
import { PrismaAdapter } from "@auth/prisma-adapter";
import { NextAuthOptions } from "next-auth";
import EmailProvider from "next-auth/providers/email";
import { prisma } from "./prisma";

export const authOptions: NextAuthOptions = {
  adapter: PrismaAdapter(prisma),
  providers: [
    EmailProvider({
      server: {
        host: process.env.EMAIL_SERVER_HOST,
        port: Number(process.env.EMAIL_SERVER_PORT),
        auth: {
          user: process.env.EMAIL_SERVER_USER,
          pass: process.env.EMAIL_SERVER_PASSWORD,
        },
      },
      from: process.env.EMAIL_FROM,
    }),
  ],
  callbacks: {
    async session({ session, user }) {
      // Session customization logic
      return session;
    },
    async jwt({ token, user }) {
      // JWT customization logic
      return token;
    },
  },
  session: {
    strategy: "jwt",
    maxAge: 60 * 60, // 1 hour
  },
  pages: {
    signIn: "/signin",
    error: "/auth/error",
    verifyRequest: "/auth/verify-request",
  },
};
```

### Key Features

- **Email Authentication** - Magic link authentication for passwordless login
- **Database Adapter** - Prisma adapter for storing sessions and users
- **JWT Sessions** - Secure JWT-based sessions with 1-hour timeout
- **Role-Based Access** - Admin and Viewer roles with different access levels
- **Protected Routes** - Route protection via middleware

### Middleware Implementation

```typescript
// middleware.ts highlights
import { withAuth } from "next-auth/middleware";
import { NextResponse } from "next/server";

export default withAuth(
  function middleware(req) {
    const pathname = req.nextUrl.pathname;
    const isAuth = req.nextauth.token;
    const isAdmin = req.nextauth.token?.role === "admin";
    
    // Authorization logic based on roles
    if (pathname.startsWith("/dashboard") && !isAdmin) {
      return NextResponse.redirect(new URL("/dashboard", req.url));
    }
    
    return NextResponse.next();
  },
  {
    callbacks: {
      authorized: ({ token }) => !!token,
    },
  }
);

export const config = {
  matcher: ["/dashboard/:path*"],
};
```

## File Uploading: Uploadthing

[Uploadthing](https://uploadthing.com) is used for file uploads in the dashboard.

### Features

- **Simple API** - Easy-to-use API for file uploads
- **Type Safety** - TypeScript support for file upload configurations
- **Multiple Upload Types** - Support for images, documents, and other file types
- **Upload Limits** - Configurable file size and type limits
- **Progress Tracking** - Real-time upload progress

### Implementation Example

```typescript
// uploadthing.ts configuration highlights
import { createUploadthing, type FileRouter } from "uploadthing/next";
 
const f = createUploadthing();
 
export const uploadRouter = {
  profileImage: f({ image: { maxFileSize: "4MB" } })
    .middleware(async ({ req }) => {
      // Authentication check
      const user = await getCurrentUser();
      if (!user) throw new Error("Unauthorized");
      return { userId: user.id };
    })
    .onUploadComplete(async ({ metadata, file }) => {
      // Update user profile with new image
      return { uploadedBy: metadata.userId };
    }),
  
  // Other upload configurations
} satisfies FileRouter;
 
export type OurFileRouter = typeof uploadRouter;
```

## Database ORM: Prisma

[Prisma](https://prisma.io) is used as the database ORM for type-safe database access.

### Key Features Used

- **Type Safety** - Generates TypeScript types from the database schema
- **Migrations** - Version-controlled database schema changes
- **Query Building** - Intuitive API for database queries
- **Relations** - Simplified handling of database relationships
- **Transactions** - Support for atomic operations

### Schema Example

```prisma
// schema.prisma highlights
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

model User {
  id            String    @id @default(cuid())
  name          String?
  email         String?   @unique
  emailVerified DateTime?
  image         String?
  role          Role      @default(VIEWER)
  accounts      Account[]
  sessions      Session[]
  teams         Team[]
  createdAt     DateTime  @default(now())
  updatedAt     DateTime  @updatedAt
}

enum Role {
  ADMIN
  VIEWER
}

model Account {
  id                String  @id @default(cuid())
  userId            String
  type              String
  provider          String
  providerAccountId String
  refresh_token     String? @db.Text
  access_token      String? @db.Text
  expires_at        Int?
  token_type        String?
  scope             String?
  id_token          String? @db.Text
  session_state     String?

  user User @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@unique([provider, providerAccountId])
}

// Other models...
```

### Client Implementation

```typescript
// prisma.ts
import { PrismaClient } from '@prisma/client';

declare global {
  var prisma: PrismaClient | undefined;
}

export const prisma = global.prisma || new PrismaClient();

if (process.env.NODE_ENV !== 'production') global.prisma = prisma;
```

## API Structure

The dashboard uses Next.js API routes to handle various backend operations.

### API Categories

- **Authentication API** (`/api/auth/*`) - Handles authentication operations
- **Proxy API** (`/api/proxy/*`) - Forwards requests to external APIs
- **Teams API** (`/api/teams/*`) - Manages team-related operations
- **Users API** (`/api/users/*`) - Handles user management
- **Transactions API** (`/api/transactions/*`) - Manages transaction data
- **Referrals API** (`/api/referrals/*`) - Handles referral operations
- **Winners API** (`/api/winners/*`) - Manages winner data

### API Implementation Example

```typescript
// Example API route
import { NextResponse } from 'next/server';
import { prisma } from '@/prisma';
import { getCurrentUser } from '@/lib/authenticated';

export async function GET() {
  try {
    // Authentication check
    const user = await getCurrentUser();
    if (!user || user.role !== 'ADMIN') {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }
    
    // Fetch data from database
    const users = await prisma.user.findMany({
      select: {
        id: true,
        name: true,
        email: true,
        role: true,
        createdAt: true,
      },
    });
    
    return NextResponse.json(users);
  } catch (error) {
    console.error('Error fetching users:', error);
    return NextResponse.json(
      { error: 'Failed to fetch users' },
      { status: 500 }
    );
  }
}
```
