# Prerequisites

Before you begin with the Strike Bot project, ensure you have the following prerequisites in place to set up your development environment effectively.

### System Requirements

* **Node.js**: Version 20.18.3 or higher
* **npm**: Version 10.8.2 or higher
* **pnpm**: Version 9.10.0 or higher
* **Redis server**: Required for session management and caching
* **MongoDB database**: Required for persistent storage

### Required Knowledge

* Basic understanding of TypeScript
* Familiarity with the Telegram Bot API
* Understanding of Node.js and async/await patterns

### Development Tools

#### Essential Tools

* Visual Studio Code or a similar IDE
* Git for version control
* MongoDB Compass (optional, for database management)
* Redis Commander (optional, for Redis management)

#### System Dependencies

**For Linux/Ubuntu**

```bash
# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install pnpm
npm install -g pnpm

# Install Redis
sudo apt-get install redis-server

# Install MongoDB
sudo apt-get install -y mongodb
```

**For macOS**

```bash
# Using Homebrew
brew install node
brew install pnpm
brew install redis
brew install mongodb-community
```

#### Development Environment

Ensure your development environment includes:

* Access to a Telegram Bot token (obtain from @BotFather)
* Local or remote MongoDB instance
* Running Redis server
* Proper network access for external API calls
