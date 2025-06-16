# AWS Subscription Details

### Account Information

* **Account Email**: info@strikebot.xyz
* **Average Monthly Cost**: \~$60 USD
* **Current Setup**: Production and Test Environment

### EC2 Instance Configuration

#### Production Server - t3.small

**Compute Resources:**

* 2 vCPUs
* 2 GiB RAM
* EBS-optimized storage
* Up to 5 Gigabit network performance
* Burstable CPU performance with credit system

**Key Features:**

* Intel Xeon Platinum 8000 series or AWS Graviton2 processor
* Suitable for production workloads with moderate traffic
* Auto-scaling capabilities
* Enhanced networking performance

#### Test Server - t2.micro

**Compute Resources:**

* 1 vCPU
* 1 GiB RAM
* EBS-only storage
* Low to moderate network performance
* Burstable CPU performance

**Key Features:**

* Intel Xeon family processor
* Ideal for development and testing
* Cost-effective for low-traffic applications
* Free tier eligible (for new AWS accounts)

### Included Services

#### Storage

* **EBS Volumes**: General Purpose SSD (gp3) storage for both instances
* **Backup & Snapshots**: Automated backup capabilities
* **Scalable Storage**: On-demand storage expansion

#### Networking

* **VPC**: Virtual Private Cloud for secure networking
* **Security Groups**: Firewall rules and access control
* **Elastic IPs**: Static IP addresses for instances
* **Load Balancing**: Application Load Balancer (if configured)

#### Additional Features

* **CloudWatch Monitoring**: Basic monitoring and logging
* **Auto Scaling**: Automatic instance scaling based on demand
* **Security**: IAM roles and policies for access management
* **Operating System**: Linux-based AMI (Amazon Machine Image)

### Deployment Configuration

* **Region**: Optimized for low latency
* **Availability**: Multi-availability zone setup for redundancy
* **SSL/TLS**: HTTPS encryption for secure communications
* **Automated Deployments**: CI/CD pipeline integration

***

_Note: Costs may vary based on actual usage, data transfer, and additional services utilized._
