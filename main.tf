
terraform {
  cloud {
    organization = "my-private-test-fadsf32"
    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "random" {
}
provider "aws" {
  region = var.AWS_REGION

}
resource "random_string" "bucket_name" {
  length  = 32
  special = false
  lower   = true
  upper   = false
}
resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}
output "random_bucket_name_id" {
  value = random_string.bucket_name.result
}
