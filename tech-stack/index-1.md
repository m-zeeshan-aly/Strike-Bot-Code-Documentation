# Backend & Services

The Strikebot Dashboard uses various backend technologies and services to provide a robust and secure admin experience.

## Authentication: NextAuth.js

[NextAuth.js](https://next-auth.js.org/) (now Auth.js) provides the authentication system for the Strikebot Dashboard.

### Implementation Details

The dashboard uses email-based authentication with magic links:

```typescript
import { PrismaAdapter } from "@next-auth/prisma-adapter";
import { prisma } from "@/prisma";
import EmailProvider from "next-auth/providers/email";
import NextAuth, { SessionStrategy, NextAuthOptions } from "next-auth";
import { JWT } from "next-auth/jwt";
import { Session, User } from "next-auth";

declare module "next-auth" {
  interface Session {
    user: {
      name?: string | null;
      email?: string | null;
      image?: string | null;
      role?: string;
    } | null;
  }

  interface User {
    role?: string;
  }
}

declare module "next-auth/jwt" {
  interface JWT {
    role?: string;
    email?: string | null;
  }
}

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
  pages: {
    signIn: "/",
    error: "/",
  },
  session: {
    strategy: "jwt" as SessionStrategy,
    maxAge: 60 * 60, // 1 hour
  },
  jwt: {
    maxAge: 60 * 60,
  },
  callbacks: {
    async signIn({ user }: { user: User }) {
      if (user.email) {
        const dbUser = await prisma.user.findUnique({
          where: { email: user.email },
        });
        if (dbUser) {
          user.role = dbUser.role;
        }
      }
      return true;
    },
    async jwt({ token, user }: { token: JWT; user?: User }) {
      if (user?.role) {
        token.role = user.role;
      }

      if (token.email) {
        const dbUser = await prisma.user.findUnique({
          where: { email: token.email },
        });
        if (!dbUser) {
          throw new Error("User no longer exists");
        }
      }

      return token;
    },
    async session({ session, token }: { session: Session; token: JWT }) {
      if (session.user) {
        session.user.role = token.role;

        const dbUser = await prisma.user.findUnique({
          where: { email: session.user.email ?? undefined },
        });

        if (!dbUser) {
          session.user = null;
        }
      }

      return session;
    },
  },
  secret: process.env.NEXTAUTH_SECRET,
};

export default NextAuth(authOptions);

```

### Key Features

* **Email Authentication** - Magic link authentication for passwordless login
* **Database Adapter** - Prisma adapter for storing sessions and users
* **JWT Sessions** - Secure JWT-based sessions with 1-hour timeout
* **Role-Based Access** - Admin and Viewer roles with different access levels
* **Protected Routes** - Route protection via middleware

### Middleware Implementation

```typescript
import { getToken } from "next-auth/jwt";
import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export async function middleware(req: NextRequest) {
  const token = await getToken({ req, secret: process.env.NEXTAUTH_SECRET });
  const url = req.nextUrl.clone();

  // If the user is authenticated
  if (token) {
    const userRole = token.role; // Assuming role is stored as 'role' in the token

    // Admin can access all pages
    if (userRole === "admin") {
      return NextResponse.next();
    }

    // Non-admins can only access /dashboard (no subpages allowed)
    if (req.nextUrl.pathname === "/") {
      url.pathname = "/dashboard";
      return NextResponse.redirect(url);
    }

    if (req.nextUrl.pathname !== "/dashboard") {
      url.pathname = "/dashboard"; // Redirect to the /dashboard page
      return NextResponse.redirect(url);
    }
  } else {
    // If not authenticated, block access to /dashboard
    if (req.nextUrl.pathname.startsWith("/dashboard")) {
      url.pathname = "/";
      return NextResponse.redirect(url);
    }
  }

  return NextResponse.next();
}

export const config = {
  matcher: ["/dashboard", "/dashboard/:path*", "/"],
};

```

## Database ORM: Prisma

[Prisma](https://prisma.io) is used as the database ORM for type-safe database access.

### Key Features Used

* **Type Safety** - Generates TypeScript types from the database schema
* **Migrations** - Version-controlled database schema changes
* **Query Building** - Intuitive API for database queries
* **Relations** - Simplified handling of database relationships

### Schema Example

```prisma
// This is your Prisma schema file,
// learn more about it in the docs: https://pris.ly/d/prisma-schema

generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

model Account {
  id                String  @id @default(cuid())
  userId            String  @map("user_id")
  type              String
  provider          String
  providerAccountId String  @map("provider_account_id")
  refresh_token     String? @db.Text
  access_token      String? @db.Text
  expires_at        Int?
  token_type        String?
  scope             String?
  id_token          String? @db.Text
  session_state     String?

  user User @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@unique([provider, providerAccountId])
  @@map("accounts")
}

model Session {
  id           String   @id @default(cuid())
  sessionToken String   @unique @map("session_token")
  userId       String   @map("user_id")
  expires      DateTime
  user         User     @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@map("sessions")
}

model User {
  id            String    @id @default(cuid())
  name          String?
  role          String
  email         String?   @unique
  emailVerified DateTime? @map("email_verified")
  image         String?
  accounts      Account[]
  sessions      Session[]

  @@map("users")
}

model VerificationToken {
  identifier String
  token      String
  expires    DateTime

  @@unique([identifier, token])
  @@map("verificationtokens")
}

```

### Client Implementation

```typescript
import { PrismaClient } from "@prisma/client";

const globalForPrisma = globalThis as unknown as { prisma: PrismaClient };

const prisma = globalForPrisma.prisma || new PrismaClient();

// Add middleware to set role on user creation and derive name from email if not provided
prisma.$use(async (params, next) => {
  if (params.model === "User" && params.action === "create") {
    const adminEmail = process.env.ADMIN_EMAIL;

    // Respect the explicitly provided role
    if (!params.args.data.role) {
      if (adminEmail && params.args.data.email === adminEmail) {
        params.args.data.role = "admin"; // Assign admin role if email matches ADMIN_EMAIL
      } else {
        params.args.data.role = "viewer"; // Default to viewer if no role is provided
      }
    }

    // Set name from email if not provided
    if (!params.args.data.name && params.args.data.email) {
      const email = params.args.data.email;
      params.args.data.name = email.split("@")[0]; // Use the part before '@' as the name
    }
  }

  return next(params);
});

if (process.env.NODE_ENV !== "production") globalForPrisma.prisma = prisma;

export { prisma };

```

## API Structure

The dashboard uses Next.js API routes to handle various backend operations.

### API Categories

* **Authentication API** (`/api/auth/*`) - Handles authentication operations
* **Proxy API** (`/api/proxy/*`) - Forwards requests to external APIs
* **Teams API** (`/api/teams/*`) - Manages team-related operations
* **Users API** (`/api/users/*`) - Handles user management
* **Transactions API** (`/api/transactions/*`) - Manages transaction data
* **Referrals API** (`/api/referrals/*`) - Handles referral operations
* **Winners API** (`/api/winners/*`) - Manages winner data

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
