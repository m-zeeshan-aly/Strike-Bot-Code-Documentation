# Core Technologies

The Strikebot Dashboard is built on a foundation of robust, modern core technologies that provide the framework for all functionality.

## Next.js 14

[Next.js](https://nextjs.org/) serves as the primary framework for the Strikebot Dashboard, providing a powerful React-based foundation with server-side rendering capabilities.

### Key Features Used
- **App Router** - The new routing system introduced in Next.js 13+ that provides improved routing capabilities
- **Server Components** - React Server Components for improved performance and reduced client-side JavaScript
- **API Routes** - Serverless functions for handling API requests
- **Server-side Rendering (SSR)** - Pre-renders pages on the server for improved performance and SEO
- **Incremental Static Regeneration (ISR)** - Updates static content after deployment without rebuilding the entire site

### Implementation Details
The project uses the standard Next.js 14 app structure with the app router. This modern approach offers improved performance and developer experience compared to the older pages router.

## TypeScript

[TypeScript](https://www.typescriptlang.org) is used throughout the project to provide static typing, enhancing code quality and developer productivity.

### Benefits in the Project
- **Type Safety** - Catches type-related errors during development
- **Enhanced IDE Support** - Better autocompletion and code navigation
- **Self-documenting Code** - Types serve as documentation for data structures
- **Refactoring Confidence** - Types help ensure refactors don't break existing functionality

### TypeScript Configuration
The project uses a strict TypeScript configuration to ensure maximum type safety:

```typescript
// tsconfig.json highlights
{
  "compilerOptions": {
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noEmit": true,
    "esModuleInterop": true,
    "moduleResolution": "node",
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [{ "name": "next" }],
    "paths": {
      "@/*": ["./*"]
    }
  }
}
```

## Tailwind CSS

[Tailwind CSS](https://tailwindcss.com) is used for styling throughout the application, providing a utility-first approach to CSS.

### Advantages
- **Productivity** - Rapid UI development with utility classes
- **Consistency** - Predefined design system ensures consistent UI
- **Performance** - Small bundle size due to optimized production builds
- **Customization** - Easily extensible through the tailwind.config.js file

### Configuration
The project uses a custom Tailwind configuration to match the design system:

```javascript
// tailwind.config.js highlights
module.exports = {
  darkMode: ["class"],
  content: [
    "./pages/**/*.{ts,tsx}",
    "./components/**/*.{ts,tsx}",
    "./app/**/*.{ts,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        // Custom color palette
        primary: {...},
        secondary: {...},
        // etc.
      },
      // Other custom theme extensions
    }
  },
  plugins: [
    require("tailwindcss-animate"),
    // Other plugins
  ]
}
```

## Database Technologies

### PostgreSQL (Neon DB)

[PostgreSQL](https://www.postgresql.org/), hosted on [Neon DB](https://neon.tech/) (serverless PostgreSQL), serves as the primary database for the application.

#### Used For
- User authentication and management
- Session storage
- Core application data

#### Advantages
- Strong data consistency and reliability
- Advanced query capabilities
- Scalable serverless deployment via Neon DB
- Cost-effective with scale-to-zero capabilities

### MongoDB

[MongoDB](https://www.mongodb.com/) serves as a secondary database for specific data operations.

#### Used For
- Storing unstructured or semi-structured data
- High-volume data that requires schema flexibility
- Specific features requiring document-based storage

#### Implementation
MongoDB connection is established using the official MongoDB client, with connection details specified in environment variables.
