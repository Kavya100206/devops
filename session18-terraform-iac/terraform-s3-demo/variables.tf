variable "aws_region" {
  description = "The AWS region where resources will be provisioned."
  type        = string
  default     = "us-east-1"
}

variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name to maintain global uniqueness."
  type        = string
  default     = "devops-iac-demo"
}

variable "environment" {
  description = "Deployment environment tier."
  type        = string
  default     = "dev"
}

variable "owner_name" {
  description = "Name of the student/engineer creating the resource."
  type        = string
  default     = "Kavya Raghavendran"
}

variable "student_roll" {
  description = "Roll number of the student."
  type        = string
  default     = "24bcs10324"
}

variable "enable_versioning" {
  description = "Toggle S3 bucket object versioning."
  type        = bool
  default     = true
}
