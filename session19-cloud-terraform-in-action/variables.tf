variable "aws_region" {
  description = "The AWS Region for deployment."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Base name for tagging and resource naming."
  type        = string
  default     = "cloud-architecture-demo"
}

variable "environment" {
  description = "Environment tier."
  type        = string
  default     = "production"
}

variable "vpc_cidr" {
  description = "CIDR block for the custom VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance size."
  type        = string
  default     = "t3.micro"
}

variable "owner_name" {
  description = "Name of the student/engineer."
  type        = string
  default     = "Kavya Raghavendran"
}

variable "student_roll" {
  description = "Roll number of the student."
  type        = string
  default     = "24bcs10324"
}
