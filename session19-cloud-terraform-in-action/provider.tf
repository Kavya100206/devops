terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "DevOps-Session19-CloudInfrastructure"
      ManagedBy   = "Terraform"
      Owner       = var.owner_name
      StudentRoll = var.student_roll
      Environment = var.environment
    }
  }
}
