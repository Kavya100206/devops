# AWS S3 (Simple Storage Service) — Storage

## Student Details

* **Name:** Kavya Raghavendran
* **Enrollment Number:** 24bcs10324

---

## 1. What is Amazon S3?

**Amazon Simple Storage Service (Amazon S3)** is an industry-leading object storage service offering 99.999999999% (11 9's) data durability, virtually infinite scalability, high availability, and strong read-after-write consistency.

Unlike block storage (EBS) or file storage (EFS), S3 stores data as flat objects identified by unique keys within buckets.

---

## 2. Core S3 Concepts

### 2.1 Buckets & Objects
* **Bucket:** Top-level container for data. Bucket names must be **globally unique** across all AWS accounts worldwide.
* **Object:** The fundamental entity stored in S3. Consists of:
  * **Key:** Name / path of the object (e.g. `images/profile.png`).
  * **Value:** The binary data payload (up to 5 TB per object).
  * **Metadata:** Key-value pairs (Content-Type, custom headers).
  * **Version ID:** Unique identifier assigned when versioning is enabled.

---

## 3. S3 Storage Classes

| Storage Class | Durability | Availability | Retrieval Fee | Typical Use Case |
|---|---|---|---|---|
| **S3 Standard** | 11 9's | 99.99% | None | Frequently accessed web assets, active databases |
| **S3 Intelligent-Tiering** | 11 9's | 99.9% | None (automation fee) | Data with unpredictable or changing access patterns |
| **S3 Standard-IA** | 11 9's | 99.9% | Per-GB retrieval | Long-term backups, disaster recovery data |
| **S3 Glacier Flexible** | 11 9's | 99.99% | Minutes to hours | Compliance archives, annual financial reports |
| **S3 Glacier Deep Archive** | 11 9's | 99.99% | 12 to 48 hours | Lowest cost archive for 7-10 year legal retention |

---

## 4. Key S3 Features & Security

### 4.1 Versioning
* Keeps multiple historical variants of an object in the same bucket.
* Protects against accidental overwrites and deletions (deleted files receive a `DeleteMarker` and can be restored).

### 4.2 Lifecycle Policies
* Automated rules to transition objects to cheaper storage classes over time (e.g. Move to Standard-IA after 30 days, Glacier after 90 days, Expire after 365 days).

### 4.3 Encryption
* **SSE-S3 (AES-256):** Default encryption where AWS manages encryption keys.
* **SSE-KMS:** Keys managed and audited through AWS Key Management Service.
* **SSE-C:** Customer-provided keys.
* **Client-Side Encryption:** Data encrypted by the client prior to uploading.

### 4.4 Bucket Policies vs IAM Policies
* **Bucket Policy:** Resource-based JSON policy attached directly to the S3 bucket to control cross-account access or enforce SSL (`aws:SecureTransport`).
* **IAM Policy:** Identity-based JSON policy attached to IAM users/roles.

---

## 5. Common Use Cases

* **Static Website Hosting:** Serving HTML/CSS/JS applications directly to users globally via Amazon CloudFront.
* **Data Lakes & Big Data Analytics:** Centralized unstructured data repository for Apache Spark, AWS Athena, and EMR.
* **Backup & Disaster Recovery:** Secondary geo-redundant storage for database dumps and EBS snapshots.
