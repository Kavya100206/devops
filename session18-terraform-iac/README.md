# Session 18: Terraform & Infrastructure as Code (IaC)

## Student Details

* **Name:** Kavya Raghavendran
* **Enrollment Number:** 24bcs10324

---

## Overview

This module covers cloud infrastructure provisioning with **HashiCorp Terraform (IaC)** and an in-depth architectural study of core **Amazon Web Services (AWS)** primitives.

---

## Deliverables

### 1. Terraform S3 Demo ([`terraform-s3-demo/`](terraform-s3-demo/))
Complete IaC pipeline declaring an Amazon S3 bucket with encryption, object ownership enforcement, and public access blocks:
* [`provider.tf`](terraform-s3-demo/provider.tf): HashiCorp AWS & Random providers with default tagging.
* [`variables.tf`](terraform-s3-demo/variables.tf): Configurable input parameters.
* [`terraform.tfvars`](terraform-s3-demo/terraform.tfvars): Environment variable values.
* [`main.tf`](terraform-s3-demo/main.tf): S3 bucket and security configurations.
* [`outputs.tf`](terraform-s3-demo/outputs.tf): Exported resource IDs, ARNs, and regions.
* [`README.md`](terraform-s3-demo/README.md): Step-by-step execution walkthrough (`init`, `fmt`, `validate`, `plan`, `apply`, `show`, `output`, `destroy`).

---

### 2. AWS Services Research ([`aws-services/`](aws-services/))
In-depth technical documentation and architectural reference for 5 core AWS service domains:

1. **[01. IAM — Governance](aws-services/01-iam/README.md):** IAM Users, Groups, Roles, JSON Policies, Principle of Least Privilege, and CloudTrail auditing.
2. **[02. EC2 — Compute](aws-services/02-ec2/README.md):** AMIs, Instance Types, Key Pairs, Stateful Security Groups, EBS block storage, IP types, and Instance Lifecycle.
3. **[03. S3 — Storage](aws-services/03-s3/README.md):** Buckets, Objects, Storage Classes (Standard, Intelligent-Tiering, Glacier), Versioning, Lifecycle Rules, and SSE Encryption.
4. **[04. VPC — Networking](aws-services/04-vpc/README.md):** CIDR blocks, Public vs Private Subnets, Route Tables, Internet Gateways, NAT Gateways, Security Groups vs NACLs.
5. **[05. DynamoDB & RDS — Database Services](aws-services/05-dynamodb-rds/README.md):** DynamoDB NoSQL (Partition & Sort keys) vs RDS Relational Engines (Multi-AZ failover, Read Replicas, automated backups).
