# ☁️ Terraform VPC + App + MongoDB Deployment

This project provisions a basic two-tier infrastructure on **AWS** using Terraform. It includes:
- A custom **VPC** with public and private subnets
- A **MongoDB database VM** in the private subnet
- An **App VM** in the public subnet that connects to MongoDB via internal IP
- Proper route tables, security groups, and user data to ensure smooth deployment

---

## 🧱 Architecture Overview

```plaintext
                        ┌────────────────────────────┐
                        │        AWS VPC             │
                        │        10.0.0.0/16         │
                        │                            │
                        │  ┌──────────────────────┐  │
                        │  │  Public Subnet       │  │
                        │  │  10.0.1.0/24         │  │
                        │  │                      │  │
                        │  │  [App EC2 Instance]  │◄─┐
                        │  └──────────────────────┘  │ │ SSH / HTTP (Ports 22, 3000)
                        │                            │ │
                        │  ┌──────────────────────┐  │ │
                        │  │  Private Subnet      │  │ │
                        │  │  10.0.2.0/24         │  │ │
                        │  │                      │  │ │
                        │  │ [MongoDB Instance]   │◄─┘ │
                        │  └──────────────────────┘    │
                        └──────────────────────────────┘
```

- **App VM** is public-facing, deployed in a subnet with internet access.
- **Database VM** is private and secure, not publicly accessible.
- Communication between them happens via internal VPC routing (10.0.x.x).
- App launch is delayed until DB is confirmed to be available, using a `user_data.sh` script.

---

## 💡 Why This Architecture?

| Component         | Purpose                                                                 |
|------------------|-------------------------------------------------------------------------|
| **VPC**           | Provides isolated network for full control of IP ranges and routing.    |
| **Public Subnet** | Hosts the app server, which needs to be accessible from the internet.   |
| **Private Subnet**| Hosts the database server, keeping it safe from direct internet access. |
| **IGW + Route**   | Allows public subnet traffic to reach the internet (e.g., software updates). |
| **Security Groups** | Enforce least privilege: app talks to DB only on port 27017, SSH/HTTP is limited. |
| **User Data**     | Ensures app starts **only after** the DB is up by injecting the DB IP.  |

---

## 🚀 How to Deploy

### 1. Prerequisites
- Terraform v1.3+
- AWS CLI configured (`aws configure`)
- Your key pair name for SSH access
- An existing MongoDB-compatible app with a `pm2 start app.js` launch method

### 2. Project File Structure

```
.
├── app_vm.tf              # App instance setup
├── compute.tf             # MongoDB instance setup
├── db_security.tf         # MongoDB security group
├── networking.tf          # VPC, subnets, gateway, routing
├── outputs.tf             # Output variables like IPs
├── security.tf            # App security group
├── variables.tf           # All variables (e.g., AMI IDs, ports)
├── user_data.sh           # Script to bootstrap app
└── main.tf                # Root Terraform config
```

---

### 3. Step-by-Step Instructions

#### ✅ Initialize Terraform
```bash
terraform init
```

#### 🔍 Preview Changes
```bash
terraform plan
```

#### 🚀 Apply the Infrastructure
```bash
terraform apply
```

Terraform will provision:
- A VPC with a public/private subnet in `eu-west-2a`
- A MongoDB EC2 instance in the private subnet
- An App EC2 instance in the public subnet
- Security groups allowing:
  - Port 22/3000 for App
  - Port 27017 for MongoDB
  - App can reach DB via private IP

---

## 🔗 How App Waits for Database

Inside your `user_data.sh` (runs when App EC2 boots):

```bash
#!/bin/bash

cd /repo/Sparta-App

export DB_HOST="mongodb://${DB_IP}:27017/posts"

pm2 start app.js
```

- `${DB_IP}` is passed from Terraform `output` variable.
- The `app.js` will connect to MongoDB using that private IP.
- Because Terraform creates the **database first**, then passes the IP to the app, this guarantees the app only launches when the DB is up.

---

## 📤 Outputs

After deployment, you’ll get outputs like:

- App Public IP → to SSH or view app in browser
- DB Private IP → passed to app internally

---

## 🧠 Tips

- Use `terraform destroy` to clean up all resources.
- Consider using **Elastic IPs** or **DNS** for more stable connections.
- Use **cloud-init logs** on EC2 to debug user data script:  
  ```bash
  sudo cat /var/log/cloud-init-output.log
  ```

---
