# CI/CD Pipeline

## GitHub Actions

The project uses GitHub Actions for automated deployment. The workflow is defined in `.github/workflows/aws.yml`.

### Workflow Steps

1. **Build & Test**
   - Node.js setup
   - Install dependencies
   - Run tests
   - Build application

2. **Docker Build**
   - Build bot image
   - Build server image
   - Tag images

3. **Deploy**
   - SSH into target server
   - Pull latest changes
   - Deploy with Docker Compose
   - Verify deployment

### Environment Variables

Required secrets in GitHub:
- `SSH_PRIVATE_KEY`: Deploy key
- `SERVER_HOST`: Target server
- `SERVER_USERNAME`: SSH user
- `BOT_TOKEN`: Telegram bot token
- `MONGO_URI`: MongoDB connection string
- Other API keys and secrets

## Server Setup

### Initial Server Configuration

1. Install required packages:
```bash
apt-get update
apt-get install -y \
  docker.io \
  docker-compose \
  nodejs \
  npm
```

2. Configure firewall:
```bash
ufw allow ssh
ufw allow 80/tcp
ufw allow 443/tcp
ufw enable
```

3. Setup SSL with Let's Encrypt:
```bash
apt-get install certbot
certbot certonly --standalone
```

### Monitoring Setup

1. Install monitoring tools:
```bash
npm install -g pm2
pm2 install pm2-logrotate
```

2. Configure log rotation:
```bash
pm2 set pm2-logrotate:max_size 10M
pm2 set pm2-logrotate:retain 7
```

## Production Checks

### Pre-deployment Checklist

1. Environment Variables
   - [ ] All required variables set
   - [ ] Production URLs configured
   - [ ] API keys valid

2. Security
   - [ ] Secrets encrypted
   - [ ] Firewall configured
   - [ ] SSL certificates valid

3. Resources
   - [ ] Adequate disk space
   - [ ] Memory limits set
   - [ ] CPU allocation checked

### Post-deployment Verification

1. Health Checks
   - [ ] Bot responding
   - [ ] API endpoints accessible
   - [ ] WebSocket connections stable

2. Performance Tests
   - [ ] Response times acceptable
   - [ ] Resource usage normal
   - [ ] No memory leaks

3. Monitoring
   - [ ] Logs being generated
   - [ ] Metrics being collected
   - [ ] Alerts configured

## Rollback Procedures

1. **Quick Rollback**
```bash
pnpm docker:prod:down
docker-compose -f compose.yml -f compose.prod.yml up -d --build
```

2. **Full Rollback**
- Stop services
- Restore database backup
- Deploy previous version
- Verify functionality

## Maintenance Procedures

### Regular Maintenance

1. Log Rotation
```bash
# Verify log rotation
pm2 logs --lines 100
```

2. Backup Verification
```bash
# Test restore procedure
mongorestore --uri="$MONGO_URI" --archive=/backup/latest.gz
```

3. SSL Certificate Renewal
```bash
certbot renew
```

### Emergency Procedures

1. Service Recovery
```bash
# Restart all services
pnpm docker:prod:down
pnpm docker:prod
```

2. Database Recovery
```bash
# Restore from latest backup
mongorestore --uri="$MONGO_URI" --drop /backup/mongodb
```
