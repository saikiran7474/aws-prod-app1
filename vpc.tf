# VPC
resource "aws_vpc" "aws-vpc-app1" {
  cidr_block = var.aws-vpc-app1
  tags = {
    Name = "aws-vpc-app1"
  }
}

# Internet gateway
resource "aws_internet_gateway" "aws-igw-app1" {
  vpc_id = aws_vpc.aws-vpc-app1.id
  tags = {
    Name = "aws-igw-app1"
  }
}