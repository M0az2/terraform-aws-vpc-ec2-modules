# 🏗️ Terraform AWS VPC & EC2 Modules Infrastructure

> Reusable, modular AWS infrastructure built with Terraform — deploying isolated VPC environments with EC2 instances using clean IaC principles.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Modules](#modules)
  - [VPC Module](#vpc-module)
  - [EC2 Module](#ec2-module)
- [Infrastructure Details](#infrastructure-details)
- [Security Group Configuration](#security-group-configuration)
- [Terraform Concepts Used](#terraform-concepts-used)
- [Deployment Commands](#deployment-commands)
- [Final Result](#final-result)
- [Technologies Used](#technologies-used)

---

## 📌 Overview

This project demonstrates how to build **reusable AWS infrastructure** using Terraform Modules.

The main objective is to create **two separate VPC environments** and deploy an **EC2 instance inside each VPC** using reusable Terraform modules.

**Built with:**
- ✅ Reusable VPC Module
- ✅ Reusable EC2 Module
- ✅ Terraform Variables & Outputs
- ✅ Infrastructure as Code (IaC)

---

## 📁 Project Structure

```
terraform-aws-vpc-ec2-modules/
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── ec2/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## 🧩 Modules

### VPC Module

A reusable Terraform module responsible for creating the **complete networking infrastructure**.

#### Resources Created

| Resource | Description |
|---|---|
| VPC | Core network boundary |
| Public Subnets | Internet-accessible subnets |
| Private Subnets | Internal-only subnets |
| Internet Gateway | Enables public internet access |
| Elastic IP | Static IP for NAT Gateway |
| NAT Gateway | Outbound internet for private subnets |
| Public Route Table | Routes traffic to IGW |
| Private Route Table | Routes traffic to NAT GW |
| Route Table Associations | Subnet ↔ route table bindings |
| Security Group | Inbound/outbound traffic rules |

#### VPC Module Variables

| Variable | Description |
|---|---|
| `vpc_cidr` | VPC CIDR block |
| `public_subnet_cidrs` | List of public subnet CIDRs |
| `private_subnet_cidrs` | List of private subnet CIDRs |
| `availability_zones` | Availability zones list |
| `resource_names` | Naming for resources |
| `project_name` | Project tag identifier |
| `environment` | Environment tag (dev/prod) |
| `security_group_config` | SG rules configuration |

#### VPC Module Outputs

| Output | Description |
|---|---|
| `vpc_id` | ID of the created VPC |
| `public_subnet_ids` | IDs of public subnets |
| `private_subnet_ids` | IDs of private subnets |
| `security_group_id` | ID of the security group |
| `internet_gateway_id` | ID of the internet gateway |
| `nat_gateway_id` | ID of the NAT gateway |

---

### EC2 Module

A reusable Terraform module used to **deploy EC2 instances** inside target subnets.

#### EC2 Module Inputs

| Input | Description |
|---|---|
| `ami_id` | AMI ID for the instance |
| `instance_type` | EC2 instance type (e.g. `t2.micro`) |
| `instance_name` | Name tag for the instance |
| `subnet_id` | Subnet to deploy into |
| `security_group_id` | Security group to attach |
| `key_pair_name` | SSH key pair name |

#### EC2 Module Outputs

| Output | Description |
|---|---|
| `instance_id` | ID of the EC2 instance |
| `public_ip` | Public IP address |
| `private_ip` | Private IP address |

---

## 🌐 Infrastructure Details

### VPC-1

| Property | Value |
|---|---|
| CIDR | `10.0.0.0/16` |
| Public Subnets | `10.0.1.0/24` · `10.0.2.0/24` |
| Private Subnets | `10.0.3.0/24` · `10.0.4.0/24` |
| Availability Zones | `us-east-1a` · `us-east-1b` |

### VPC-2

| Property | Value |
|---|---|
| CIDR | `192.168.0.0/16` |
| Public Subnets | `192.168.1.0/24` · `192.168.2.0/24` |
| Private Subnets | `192.168.3.0/24` · `192.168.4.0/24` |
| Availability Zones | `us-east-1a` · `us-east-1b` |

---

## 🔒 Security Group Configuration

### Inbound Rules

| Protocol | Port | Description |
|---|---|---|
| TCP | 22 | SSH Access |
| TCP | 80 | HTTP Access |

### Outbound Rules

| Protocol | Port | Description |
|---|---|---|
| All | All | Allow all outbound traffic |

---

## 💡 Terraform Concepts Used

### Modules
Reusable Terraform modules were created to **avoid code duplication** and **improve scalability**.
- `modules/vpc` — Full networking stack
- `modules/ec2` — EC2 instance provisioning

### Variables
All configurable values are managed using Terraform variables:
- AWS Region
- VPC CIDRs
- Subnet CIDRs
- Availability Zones
- AMI ID
- Instance Type
- Key Pair Name
- Project Name
- Environment

### Outputs
Terraform outputs expose resource information and **allow modules to communicate with each other**.

```hcl
# EC2 module consuming VPC module outputs
subnet_id         = module.vpc1.public_subnet_1_id
security_group_id = module.vpc1.security_group_id
```

---

## 🚀 Deployment Commands

```bash
# 1. Initialize Terraform & download providers
terraform init

# 2. Format Terraform files
terraform fmt

# 3. Validate configuration
terraform validate

# 4. Review execution plan
terraform plan

# 5. Deploy infrastructure
terraform apply

# 6. View outputs
terraform output

# 7. Remove all infrastructure
terraform destroy
```

---

## ✅ Final Result

After a successful `terraform apply`, the following resources are provisioned:

| Resource | Count |
|---|---|
| VPCs | 2 |
| Public Subnets | 4 |
| Private Subnets | 4 |
| Internet Gateways | 2 |
| Elastic IPs | 2 |
| NAT Gateways | 2 |
| Route Tables | 4 |
| Route Table Associations | 8 |
| Security Groups | 2 |
| EC2 Instances | 2 |

### EC2 Instances

| Instance | Name | Location |
|---|---|---|
| Instance 1 | `web-server-vpc1` | VPC-1 → Public Subnet 1 |
| Instance 2 | `web-server-vpc2` | VPC-2 → Public Subnet 1 |

---

## 🛠️ Technologies Used

![Terraform](https://img.shields.io/badge/Terraform-623CE4?style=flat&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=flat&logo=amazon-aws&logoColor=white)

| Technology | Role |
|---|---|
| Terraform | Infrastructure provisioning |
| AWS Provider | Cloud resource management |
| AWS VPC | Network isolation & routing |
| AWS EC2 | Compute instances |
| Terraform Modules | Reusable infrastructure components |
| IaC | Version-controlled infrastructure |
| Floci | Local AWS environment simulation |

---

<div align="center">
  <sub>Built with ❤️ using Terraform & AWS</sub>
</div>
