# Installation

This guide provides step-by-step instructions to install and set up the Strike Bot project on your local machine.

### Step-by-Step Installation Guide

#### 1. Clone the Repository

Clone the Strike Bot repository from GitHub and navigate into the project directory:

```bash
git clone <repository-url>
cd strike-bot
```

#### 2. Install Dependencies

Install the project dependencies using pnpm:

```bash
pnpm install
```

#### 3. Environment Setup

Copy the example environment file and configure the necessary environment variables:

```bash
cp .env.example .env
```

Open the `.env` file in your preferred text editor and set the following variables:

```env
BOT_TOKEN=your_telegram_bot_token
MONGO_URI=mongodb://localhost:27017/strike-bot
REDIS_SERVER_URL=redis://localhost:6379
IV_KEY=your_iv_key
ENCRYPTION_KEY=your_encryption_key
QUICKNODE_API_KEY=your_quicknode_api_key
PLATFORM_FEE_WALLET_ADDRESS=your_platform_fee_wallet
PLATFORM_FEE_PERCENTAGE=1
```

#### 4. Build the Project

Build the project using pnpm:

```bash
pnpm build
```

#### 5. Start Development Server

Start the development server using pnpm:

```bash
pnpm dev
```

### Docker Installation

You can also install and run the Strike Bot project using Docker.

#### Using Docker Compose

**Development**

To run the project in development mode using Docker Compose:

```bash
docker-compose up -d
```

**Production**

To run the project in production mode using Docker Compose:

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

#### Manual Docker Build

Alternatively, you can build and run the Docker image manually:

```bash
docker build -t strike-bot .
docker run -d \
  --name strike-bot \
  --env-file .env \
  -p 3000:3000 \
  strike-bot
```

### Verifying Installation

After installation, verify that the setup is correct by performing the following checks:

#### Check Bot Status

Check the status of the bot by sending a request to the server:

```bash
curl http://localhost:3000/
```

#### Test Bot Connection

Send the `/start` command to your bot on Telegram to test the connection.

#### Verify Redis Connection

Verify the Redis connection by running:

```bash
redis-cli ping
```

If Redis is running correctly, it should return `PONG`.

#### Verify MongoDB Connection

Verify the MongoDB connection by running:

```bash
mongosh
```

This should open the MongoDB shell if the connection is successful.
