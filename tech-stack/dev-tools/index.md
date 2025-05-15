# Development Tools

The Strikebot Dashboard uses a comprehensive set of development tools to ensure code quality, consistency, and developer productivity.

## Linting: ESLint

[ESLint](https://eslint.org) is used for code linting throughout the project, ensuring code quality and consistency.

### Configuration

The project uses a custom ESLint configuration with Next.js and TypeScript integration:

```javascript
// .eslintrc.js highlights
module.exports = {
  extends: [
    'next/core-web-vitals',
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:react/recommended',
    'plugin:react-hooks/recommended',
    'plugin:prettier/recommended',
  ],
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint', 'react', 'react-hooks'],
  rules: {
    // Custom rules and overrides
    'react/react-in-jsx-scope': 'off',
    'react/prop-types': 'off',
    '@typescript-eslint/explicit-module-boundary-types': 'off',
    // Additional custom rules...
  },
};
```

### Integration

ESLint is integrated into the development workflow through:

- **VS Code Extension** - Real-time linting in the editor
- **npm Scripts** - Running linting via `npm run lint`
- **Pre-commit Hooks** - Automated linting before commits
- **CI Pipeline** - Linting checks in continuous integration

## Pre-commit Hooks: Husky with lint-staged

[Husky](https://typicode.github.io/husky/) and [lint-staged](https://github.com/okonet/lint-staged) are used to enforce code quality checks before commits.

### Configuration

```javascript
// package.json highlights
{
  "husky": {
    "hooks": {
      "pre-commit": "lint-staged"
    }
  },
  "lint-staged": {
    "*.{js,jsx,ts,tsx}": [
      "eslint --fix",
      "prettier --write"
    ],
    "*.{json,md}": [
      "prettier --write"
    ]
  }
}
```

### Benefits

- **Prevents Bad Commits** - Stops commits with linting errors
- **Automatic Fixes** - Fixes simple issues automatically
- **Consistent Codebase** - Ensures all committed code meets standards
- **Time Saving** - Catches issues before they reach code review

## Formatting: Prettier

[Prettier](https://prettier.io) with tailwindcss plugin ensures consistent code formatting throughout the project.

### Configuration

```javascript
// prettier.config.js
module.exports = {
  plugins: [require('prettier-plugin-tailwindcss')],
  semi: true,
  singleQuote: true,
  printWidth: 80,
  tabWidth: 2,
  trailingComma: 'es5',
  arrowParens: 'avoid',
  endOfLine: 'lf',
};
```

### Integration

Prettier is integrated into the development workflow through:

- **VS Code Extension** - Format on save
- **npm Scripts** - Running formatting via `npm run format`
- **lint-staged** - Automatic formatting before commit
- **ESLint Integration** - eslint-plugin-prettier for unified experience

## Build Tool: Next.js Built-in Build System

The project uses Next.js's built-in build system for development, building, and production deployment.

### Build Scripts

```json
// package.json scripts
{
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "format": "prettier --write \"**/*.{ts,tsx,md}\"",
    "analyze": "ANALYZE=true next build"
  }
}
```

### Features Used

- **Fast Refresh** - Instant feedback during development
- **Build Optimizations** - Automatic code splitting and bundling
- **Image Optimization** - Built-in image optimization
- **Static Analysis** - Type checking during build
- **Bundle Analysis** - Optional bundle size analysis

## Version Control Practices

The project follows a structured approach to version control using Git:

### Branching Strategy

- **main** - Production-ready code
- **develop** - Integration branch for features
- **feature/*** - Feature branches
- **bugfix/*** - Bug fix branches
- **hotfix/*** - Emergency fixes for production

### Commit Conventions

The project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Types include:
- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation changes
- **style**: Changes that don't affect code meaning
- **refactor**: Code change that neither fixes a bug nor adds a feature
- **perf**: Code change that improves performance
- **test**: Adding missing tests
- **chore**: Changes to the build process or auxiliary tools

### Pull Request Process

1. Create a feature branch from develop
2. Implement changes with regular commits
3. Push branch and create a pull request
4. Ensure CI checks pass
5. Get code review approval
6. Merge to develop (squash commits)
7. Periodically merge develop to main for releases

## Deployment Pipeline

The project uses a structured deployment pipeline:

1. **Local Development** - Using `next dev`
2. **Continuous Integration** - Automated tests and builds on pull requests
3. **Staging Deployment** - Automated deployment to staging environment
4. **Production Deployment** - Manual promotion to production after verification

### Environment Specific Configurations

Each environment (development, staging, production) has its own set of environment variables and configurations to ensure proper isolation and testing.
