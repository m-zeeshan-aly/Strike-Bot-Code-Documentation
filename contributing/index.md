# Contributing Guidelines

Thank you for considering contributing to the Strikebot Dashboard! This document provides guidelines and instructions for contributing to the project.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Pull Request Process](#pull-request-process)
- [Issue Reporting](#issue-reporting)
- [Documentation](#documentation)
- [Testing](#testing)
- [Release Process](#release-process)

## Code of Conduct

The Strikebot Dashboard project adheres to a Code of Conduct that all contributors are expected to follow. By participating, you are expected to uphold this code. Please report unacceptable behavior to the project maintainers.

### Our Pledge

We pledge to make participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards

Examples of behavior that contributes to creating a positive environment include:

- Using welcoming and inclusive language
- Being respectful of differing viewpoints and experiences
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards other community members

## Getting Started

### Prerequisites

Before you begin contributing, ensure you have the following installed:

- Node.js (v18.x or later)
- npm (v8.x or later)
- Git

### Setting Up the Development Environment

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/yourusername/strikebot-dashboard.git
   cd strikebot-dashboard
   ```
3. Install dependencies:
   ```bash
   npm install
   ```
4. Set up environment variables:
   ```bash
   cp env.example.txt .env
   # Edit .env with your configuration
   ```
5. Generate Prisma client:
   ```bash
   npx prisma generate
   ```
6. Run the development server:
   ```bash
   npm run dev
   ```

## Development Workflow

### Branching Strategy

We use a simplified [GitHub Flow](https://guides.github.com/introduction/flow/) branching model:

- `main`: The production branch. All code in this branch should be deployable.
- Feature branches: Created for new features and bug fixes.

### Branch Naming Convention

Branch names should follow this pattern:

- `feature/short-description`: For new features
- `bugfix/short-description`: For bug fixes
- `refactor/short-description`: For code refactoring
- `docs/short-description`: For documentation changes

### Commit Messages

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification for commit messages:

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

Types include:
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation changes
- `style`: Changes that do not affect the meaning of the code (formatting, missing semi-colons, etc.)
- `refactor`: Code changes that neither fix a bug nor add a feature
- `test`: Adding or correcting tests
- `chore`: Changes to the build process or auxiliary tools

Example:
```
feat(auth): implement magic link authentication

Implement email-based authentication using magic links with NextAuth.js.

Closes #123
```

## Coding Standards

### TypeScript

- Use TypeScript for all new code
- Define proper interfaces and types
- Avoid using `any` type
- Use type inference where appropriate

### React

- Use functional components with hooks
- Keep components small and focused
- Use named exports for components
- Follow the React hooks rules

### File Structure

- Follow the existing project structure
- Place components in the `components` directory
- Place pages in the `app` directory (Next.js App Router)
- Place utility functions in the `lib` or `utils` directory
- Place types in the `types` directory

### Code Formatting

The project uses ESLint and Prettier for code formatting. Before committing, ensure your code is properly formatted:

```bash
npm run lint
npm run format
```

Pre-commit hooks will automatically run these commands when you commit.

## Pull Request Process

1. Create a new branch from `main` for your changes
2. Make your changes following the coding standards
3. Add or update tests as necessary
4. Update documentation as necessary
5. Run the linting and formatting tools
6. Push your branch to your fork
7. Submit a pull request to the `main` branch

### Pull Request Template

When creating a pull request, please use the provided template and fill in all sections.

### Code Review Process

All pull requests will be reviewed by at least one project maintainer. Reviewers may request changes before merging. The review process includes:

- Code quality and adherence to coding standards
- Test coverage
- Documentation completeness
- Performance considerations
- Security considerations

## Issue Reporting

### Bug Reports

When reporting a bug, please include:

- A clear and descriptive title
- Steps to reproduce the bug
- Expected behavior
- Actual behavior
- Screenshots (if applicable)
- Environment information (browser, OS, etc.)

### Feature Requests

When requesting a feature, please include:

- A clear and descriptive title
- A detailed description of the feature
- The problem the feature would solve
- Any alternatives you've considered
- Any additional context or screenshots

## Documentation

### Code Documentation

- Use JSDoc comments for functions, classes, and complex code blocks
- Document all props in React components
- Explain complex algorithms or business logic

### Project Documentation

- Update the README.md file for major changes
- Update the documentation in the `docs` directory

## Testing

### Test Strategy

The project uses the following types of tests:

- Unit tests: For individual functions and components
- Integration tests: For testing interactions between components
- End-to-end tests: For testing the application as a whole

### Writing Tests

- Write tests for new features and bug fixes
- Aim for high test coverage
- Test edge cases and error conditions

### Running Tests

```bash
# Run all tests
npm test

# Run tests in watch mode
npm test -- --watch

# Run tests with coverage
npm test -- --coverage
```

## Release Process

The release process is managed by the project maintainers. Contributors don't need to worry about this, but for transparency:

1. Maintainers merge pull requests into the `main` branch
2. When ready for a release, maintainers create a new version using semantic versioning
3. A GitHub Action builds and deploys the application

### Versioning

We use [Semantic Versioning](https://semver.org/) for version numbers:

- MAJOR version for incompatible API changes
- MINOR version for new functionality in a backward-compatible manner
- PATCH version for backward-compatible bug fixes

## Thank You

Thank you for contributing to the Strikebot Dashboard project! Your efforts help make this project better for everyone.
