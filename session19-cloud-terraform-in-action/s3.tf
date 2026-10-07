# Random suffix generator for global uniqueness
resource "random_id" "s3_suffix" {
  byte_length = 4
}

# Application Asset S3 Bucket
resource "aws_s3_bucket" "app_storage" {
  bucket        = "${var.project_name}-assets-${var.student_roll}-${random_id.s3_suffix.hex}"
  force_destroy = true

  tags = {
    Name        = "${var.project_name}-app-storage"
    Environment = var.environment
  }
}

# Ownership controls
resource "aws_s3_bucket_ownership_controls" "app_storage_ownership" {
  bucket = aws_s3_bucket.app_storage.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# Block all public access (Secured storage)
resource "aws_s3_bucket_public_access_block" "app_storage_pab" {
  bucket = aws_s3_bucket.app_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Versioning Configuration
resource "aws_s3_bucket_versioning" "app_storage_versioning" {
  bucket = aws_s3_bucket.app_storage.id

  versioning_configuration {
    status = "Enabled"
  }
}

# AES-256 Server-Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "app_storage_encryption" {
  bucket = aws_s3_bucket.app_storage.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
