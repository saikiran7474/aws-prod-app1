terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = var.region
}

#  backend s3
 terraform {
  backend "s3" {
    bucket = "aws-prod-app1-bucket"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}












