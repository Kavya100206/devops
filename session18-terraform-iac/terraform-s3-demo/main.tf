# Generate a random suffix for global S3 bucket name uniqueness
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Define the AWS S3 Bucket
resource "aws_s3_bucket" "demo_bucket" {
  bucket        = "${var.bucket_prefix}-${var.student_roll}-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    Name    = "${var.bucket_prefix}-${var.environment}"
    Purpose = "Session 18 Terraform S3 Demo"
  }
}

# Configure S3 Bucket Ownership Controls
resource "aws_s3_bucket_ownership_controls" "demo_bucket_acl_ownership" {
  bucket = aws_s3_bucket.demo_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# Configure S3 Bucket Block Public Access (DevSecOps Best Practice)
resource "aws_s3_bucket_public_access_block" "demo_bucket_pab" {
  bucket = aws_s3_bucket.demo_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Configure S3 Bucket Versioning
resource "aws_s3_bucket_versioning" "demo_bucket_versioning" {
  bucket = aws_s3_bucket.demo_bucket.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

# Configure Server-Side Encryption (SSE-S3 AES-256)
resource "aws_s3_bucket_server_side_encryption_configuration" "demo_bucket_encryption" {
  bucket = aws_s3_bucket.demo_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
