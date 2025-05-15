# Technology Stack

The Strikebot Dashboard is built using a modern, robust technology stack designed for performance, scalability, and developer experience. This section provides a comprehensive overview of all technologies used in the project.

## Stack Overview

The technology stack is divided into four main categories:

1. [Core Technologies](./core/index.md) - The fundamental frameworks and languages
2. [Frontend Technologies](./frontend/index.md) - UI components and client-side libraries
3. [Backend & Services](./backend/index.md) - Server-side technologies and services
4. [Development Tools](./dev-tools/index.md) - Tools used for development, testing, and deployment

## Why This Stack?

The technology choices for the Strikebot Dashboard were made with several key considerations in mind:

### Performance
Using Next.js with server-side rendering capabilities provides optimal loading performance for users, while TanStack Table and other optimized libraries ensure smooth interaction with large datasets.

### Developer Experience
TypeScript provides strong typing, enhancing code quality and developer productivity. Modern tools like ESLint, Prettier, and Husky streamline the development workflow.

### Scalability
The combination of PostgreSQL (via Neon DB) and MongoDB provides a flexible database architecture that can scale with increasing data and user load.

### Maintainability
The project structure follows best practices for Next.js applications, making it easier to maintain and extend the codebase over time.

## Stack Diagram

```
┌───────────────────────────────────────────────────────────────┐
│                        Client Browser                         │
└───────────────────────────────────────────────────────────────┘
                               ▲
                               │
                               ▼
┌───────────────────────────────────────────────────────────────┐
│                          Next.js 14                           │
├───────────────┬───────────────────────────┬───────────────────┤
│   React UI    │      API Routes           │    Server-side    │
│ (TypeScript)  │                           │    Rendering      │
└───────────────┴───────────────────────────┴───────────────────┘
                               ▲
                               │
                               ▼
┌───────────────────────────────────────────────────────────────┐
│                         Authentication                         │
│                        (NextAuth.js)                           │
└───────────────────────────────────────────────────────────────┘
                               ▲
                               │
                               ▼
┌───────────────┬───────────────────────────┬───────────────────┐
│               │                           │                   │
│  PostgreSQL   │         Prisma ORM        │     MongoDB       │
│  (Neon DB)    │                           │                   │
│               │                           │                   │
└───────────────┴───────────────────────────┴───────────────────┘
```

For detailed information about each component of the technology stack, please refer to the respective subcategories in this section.
