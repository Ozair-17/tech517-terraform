# Introduction to Infrastructure as Code (IaC)

This repository provides a concise introduction to **Infrastructure as Code (IaC)**, explaining the problem it solves, how it works, and how it fits into modern cloud and platform engineering practices.

---

## What problem needs solving?

Traditional infrastructure management is largely manual and introduces several challenges:

- Manual configuration through cloud consoles and SSH
- Inconsistent environments across teams
- Slow provisioning of resources
- High risk of human error
- Difficult to reproduce or audit infrastructure changes

As systems scale, manual infrastructure becomes unreliable, inefficient, and hard to maintain.

---

## What have we automated?

Using Infrastructure as Code, we automate the creation and management of:

- Virtual machines and servers
- Networking (VPCs, subnets, routing tables)
- Load balancers and auto-scaling groups
- Storage services and databases
- Security controls (firewalls, security groups, IAM)
- Entire environments (development, testing, production)

Infrastructure can now be created from scratch in a repeatable and automated way.

---

## Solving the problem

IaC solves these challenges by:

- Defining infrastructure using code files
- Making infrastructure repeatable and consistent
- Enabling version control using Git
- Allowing automation through CI/CD pipelines
- Reducing human error
- Making infrastructure auditable and recoverable

---

## What is Infrastructure as Code (IaC)?

Infrastructure as Code (IaC) is the practice of managing and provisioning infrastructure using **machine-readable configuration files**, rather than manual processes.

The desired state of infrastructure is defined in code, and IaC tools automatically create and manage resources to match that state.

---

## Benefits of IaC

- **Consistency** – identical environments every time
- **Speed** – infrastructure provisioned in minutes
- **Scalability** – easy to scale up or down
- **Version control** – track and review changes
- **Auditability** – clear change history
- **Disaster recovery** – quickly rebuild infrastructure
- **Automation-ready** – integrates with CI/CD pipelines

---

## When and where to use IaC

IaC is best used when:

- Working with cloud platforms (AWS, Azure, GCP)
- Managing multiple environments (dev, test, prod)
- Building scalable or distributed systems
- Working in teams
- Automating deployments and infrastructure changes

Common use cases include platform engineering, DevOps workflows, and cloud-native systems.

---

## What tools are available for IaC?

### Infrastructure Provisioning / Orchestration Tools
- Terraform
- AWS CloudFormation
- Azure ARM / Bicep
- Pulumi

### Configuration Management (CM) Tools
- Ansible
- Chef
- Puppet
- SaltStack

### IaC-Adjacent Tools
- Kubernetes (YAML manifests)
- Helm charts

These tools are often used together rather than as replacements for one another.

---

## What is provisioning of infrastructure? Do CM tools do it?

**Provisioning** refers to creating infrastructure resources such as:
- Virtual machines
- Networks
- Load balancers
- Databases

Provisioning is handled by tools like Terraform and CloudFormation.

Configuration Management tools **do not provision infrastructure effectively**. They assume infrastructure already exists and focus on configuring it.

---

## What is configuration management (CM)?

Configuration Management is the process of managing and maintaining the software and configuration inside existing servers.

It is used to:
- Install and manage software packages
- Configure services and applications
- Manage system files
- Apply patches and updates
- Enforce a desired system state

Examples include installing Nginx, configuring environment variables, and ensuring services are running correctly.

---

## Key takeaway

**Infrastructure as Code builds the infrastructure.**  
**Configuration Management configures what runs on it.**

Both are essential for reliable, scalable, and automated systems.
