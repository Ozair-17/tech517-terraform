- [Terraform Installation Guide (macOS)](#terraform-installation-guide-macos)
  - [Step 1: Download Terraform](#step-1-download-terraform)
  - [Step 2: Extract the ZIP file](#step-2-extract-the-zip-file)
  - [Step 3: Move Terraform to a Directory on PATH](#step-3-move-terraform-to-a-directory-on-path)
  - [Step 4: Allow Terraform in macOS Security (if prompted)](#step-4-allow-terraform-in-macos-security-if-prompted)
  - [Step 5: Verify Installation](#step-5-verify-installation)
  - [Step 6: (Optional) Create a Test Terraform Project](#step-6-optional-create-a-test-terraform-project)
- [AWS Setup for Terraform (macOS)](#aws-setup-for-terraform-macos)
  - [Objective](#objective)
  - [Prerequisites](#prerequisites)
  - [Step 1: Install AWS CLI](#step-1-install-aws-cli)
    - [Check if AWS CLI is already installed](#check-if-aws-cli-is-already-installed)
    - [Install AWS CLI using Homebrew](#install-aws-cli-using-homebrew)
  - [Step 2: Prepare AWS Credentials](#step-2-prepare-aws-credentials)
  - [Step 3: Configure AWS Credentials (Best Practice)](#step-3-configure-aws-credentials-best-practice)
    - [Example input:](#example-input)
  - [Step 4: Verify Credentials Are Stored](#step-4-verify-credentials-are-stored)
  - [What NOT To Do](#what-not-to-do)
  - [Credential Resolution (How Terraform Finds AWS Keys)](#credential-resolution-how-terraform-finds-aws-keys)



# Terraform Installation Guide (macOS)

This README provides a **step-by-step guide** to download, install, and verify **Terraform** on **macOS**, following best practices used in real DevOps environments.

---


## Step 1: Download Terraform

1. Go to the official HashiCorp Terraform downloads page:
   
   👉 https://developer.hashicorp.com/terraform/downloads

2. Under **macOS**, download the correct package:
   - **AMD64** → Intel Macs
   - **ARM64** → Apple Silicon (M1 / M2 / M3)

3. This will download a ZIP file similar to:
   ```
   terraform_1.x.x_darwin_amd64.zip
   ```

---

## Step 2: Extract the ZIP file

1. Locate the downloaded ZIP file (usually in `~/Downloads`).
2. Double-click the ZIP file to extract it.
3. You should now see a folder containing:
   ```
   terraform
   LICENSE.txt
   ```

The `terraform` file is the executable.

---

## Step 3: Move Terraform to a Directory on PATH

To run Terraform from anywhere in the terminal, move it to `/usr/local/bin`.

From the folder containing the `terraform` file, run:

```bash
sudo mv terraform /usr/local/bin/
```

Enter your Mac password when prompted (you will not see it typing).

Then make sure it is executable:

```bash
sudo chmod +x /usr/local/bin/terraform
```

---

## Step 4: Allow Terraform in macOS Security (if prompted)

If macOS blocks Terraform:

1. Go to **System Settings → Privacy & Security**
2. Scroll down to **Security**
3. Click **Allow Anyway** next to Terraform
4. Run Terraform again when prompted and click **Open**

This is normal behaviour for command-line tools.

---

## Step 5: Verify Installation

Open a new Terminal window and run:

```bash
terraform version
```

Expected output:
```text
Terraform v1.x.x
```

You can also check its location:

```bash
which terraform
```

Expected:
```text
/usr/local/bin/terraform
```

---

## Step 6: (Optional) Create a Test Terraform Project

```bash
mkdir terraform-lab
cd terraform-lab
touch main.tf
```

Add the following to `main.tf`:

```hcl
terraform {
  required_version = ">= 1.0"
}
```

Then initialise Terraform:

```bash
terraform init
```

If this completes successfully, Terraform is ready to use.

---

# AWS Setup for Terraform (macOS)

This README explains **how to set up AWS credentials locally** so that **Terraform can authenticate securely** using best practices. This approach avoids hard-coding secrets and mirrors real-world DevOps setups.

---

## Objective

* Install AWS CLI
* Configure AWS credentials **permanently**
* Verify access to AWS
* Ensure Terraform can automatically use AWS credentials

---

## Prerequisites

* Terraform installed and available on PATH
* macOS
* AWS Access Key CSV file provided to you

---

## Step 1: Install AWS CLI

### Check if AWS CLI is already installed

```bash
aws --version
```

If a version is returned, skip to **Step 2**.

---

### Install AWS CLI using Homebrew

```bash
brew install awscli
```

Verify installation:

```bash
aws --version
```

Expected output (example):

```text
aws-cli/2.x.x Python/3.x
```

---

## Step 2: Prepare AWS Credentials

From the AWS CSV file, locate:

* **AWS Access Key ID**
* **AWS Secret Access Key**

⚠️ Important:

* Do **not** include quotes
* Do **not** include spaces
* Paste **values only**, not variable names

---

## Step 3: Configure AWS Credentials (Best Practice)

Run the following command:

```bash
aws configure
```

You will be prompted:

```text
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [None]:
Default output format [None]:
```

### Example input:

* AWS Access Key ID → paste from CSV
* AWS Secret Access Key → paste from CSV
* Default region name →

  * Ireland (Dublin): `eu-west-1`
* Default output format → press Enter (leave blank)

---

## Step 4: Verify Credentials Are Stored

AWS stores credentials permanently in:

```text
~/.aws/credentials
~/.aws/config
```

Check credentials file:

```bash
cat ~/.aws/credentials
```

Expected format:

```ini
[default]
aws_access_key_id=AKIA...
aws_secret_access_key=...
```

---


## What NOT To Do

❌ Do NOT hard-code credentials in Terraform files
❌ Do NOT commit AWS keys to GitHub
❌ Avoid exporting secrets directly in shell config files

---

## Credential Resolution (How Terraform Finds AWS Keys)

Terraform checks credentials in this order:

1. Environment variables
2. AWS CLI profiles (**used here**)
3. IAM role (when running on AWS)

This setup follows **industry best practice**.

---



✅ AWS is now correctly configured for Terraform.

