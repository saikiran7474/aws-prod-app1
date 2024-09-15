
 terraform {
  backend "s3" {
    bucket = "aws-prod-app1-bucket"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}

