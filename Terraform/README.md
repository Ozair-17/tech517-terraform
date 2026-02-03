- [Terraform – Concepts, Usage, and Best Practices](#terraform--concepts-usage-and-best-practices)
  - [1. What is Terraform? What is it used for?](#1-what-is-terraform-what-is-it-used-for)
  - [2. Why use Terraform? What are the benefits?](#2-why-use-terraform-what-are-the-benefits)
  - [3. Alternatives to Terraform](#3-alternatives-to-terraform)
  - [4. Who is using Terraform in the industry?](#4-who-is-using-terraform-in-the-industry)
  - [5. In IaC, what is orchestration?](#5-in-iac-what-is-orchestration)
  - [6. How does Terraform act as an orchestrator?](#6-how-does-terraform-act-as-an-orchestrator)
  - [7. Best practice for supplying AWS credentials to Terraform](#7-best-practice-for-supplying-aws-credentials-to-terraform)
  - [8. Order in which Terraform looks up AWS credentials](#8-order-in-which-terraform-looks-up-aws-credentials)
  - [9. What is best practice to supply AWS credentials?](#9-what-is-best-practice-to-supply-aws-credentials)
  - [10. Why use Terraform for different environments (production, testing, etc.)](#10-why-use-terraform-for-different-environments-production-testing-etc)
  - [Summary](#summary)



# Terraform – Concepts, Usage, and Best Practices

This document answers key **Infrastructure as Code (IaC)** questions related to **Terraform**, written in clear, practical language based on conceptual understanding rather than copied definitions. It is suitable for coursework, interviews, and real-world DevOps reference.

---

## 1. What is Terraform? What is it used for?

Terraform is an **Infrastructure as Code (IaC)** tool created by HashiCorp. It allows engineers to **define, provision, and manage infrastructure using code** instead of manual configuration through cloud consoles.

Terraform is used to:
- Create cloud resources (e.g. EC2, VPCs, S3, databases)
- Manage infrastructure lifecycle (create, update, destroy)
- Keep infrastructure consistent and reproducible
- Version-control infrastructure changes

Terraform works across many providers (AWS, Azure, GCP, Kubernetes, etc.), making it **cloud-agnostic**.

---

## 2. Why use Terraform? What are the benefits?

Key benefits of Terraform include:

- **Consistency & repeatability** – Infrastructure can be recreated exactly the same way every time
- **Automation** – Reduces human error compared to manual setup
- **Version control** – Infrastructure definitions can be tracked in Git
- **Multi-cloud support** – One tool for many providers
- **State awareness** – Terraform knows what already exists and what needs changing
- **Declarative approach** – You define *what you want*, Terraform figures out *how to do it*

Overall, Terraform enables **scalable, reliable, and auditable infrastructure management**.

---

## 3. Alternatives to Terraform

Common alternatives include:

- **AWS CloudFormation** – AWS-native IaC tool (AWS-only)
- **Azure Bicep / ARM Templates** – Azure-native IaC
- **Pulumi** – IaC using programming languages (Python, TypeScript, etc.)
- **Ansible** – Configuration management (procedural, not state-based)
- **Chef / Puppet** – Older configuration management tools

Terraform stands out because it is:
- Cloud-agnostic
- Declarative
- Widely adopted across industries

---

## 4. Who is using Terraform in the industry?

Terraform is widely used by:

- Cloud-native companies and startups
- Large enterprises
- Financial services and fintech
- Government and public sector organisations
- DevOps and platform engineering teams

It is commonly used in environments that require:
- Compliance and auditability
- Multi-environment deployments
- Infrastructure standardisation

---

## 5. In IaC, what is orchestration?

In Infrastructure as Code, **orchestration** refers to:

- Coordinating the creation, modification, and deletion of resources
- Managing dependencies between resources
- Ensuring resources are created in the correct order

For example:
- A VPC must exist before a subnet
- A subnet must exist before an EC2 instance

---

## 6. How does Terraform act as an orchestrator?

Terraform acts as an orchestrator by:

- Building a **dependency graph** of resources
- Determining the correct order of execution
- Managing changes through `plan` and `apply`
- Ensuring the final state matches the desired configuration

Terraform automatically understands relationships between resources and orchestrates them without manual sequencing.

---

## 7. Best practice for supplying AWS credentials to Terraform

Best practice is to:

- Use **AWS CLI profiles** or **IAM roles**
- Allow Terraform to **discover credentials automatically**
- Keep credentials **out of Terraform code**

This approach is secure, scalable, and mirrors real production setups.

---

## 8. Order in which Terraform looks up AWS credentials

Terraform resolves AWS credentials in the following priority order:

1. **Environment variables**
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

2. **AWS shared credentials file** (`~/.aws/credentials`)
   - Default or named profiles

3. **IAM role** (when running on AWS services like EC2)

Terraform uses the **first valid credentials it finds**.

---

## 9. What is best practice to supply AWS credentials?

Best practice includes:

- Use `aws configure` to store credentials locally
- Use IAM roles when running Terraform in AWS
- Use separate credentials per environment

AWS credentials should **never** be:

- Hard-coded in `.tf` files
- Stored in Git repositories
- Shared in plain text or screenshots

---

## 10. Why use Terraform for different environments (production, testing, etc.)

Terraform supports multiple environments by:

- Using separate state files
- Using workspaces
- Using different variable files

Benefits include:

- Clear separation between environments
- Reduced risk of affecting production
- Reusable infrastructure definitions
- Environment-specific configurations

This allows teams to safely test changes before deploying to production.

---

## Summary

Terraform enables reliable, secure, and scalable infrastructure management by combining Infrastructure as Code, orchestration, and best practices for credential management. It is a core tool in modern DevOps and platform engineering workflows.

---

✅ End of doc