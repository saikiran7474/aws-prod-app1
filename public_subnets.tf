# Public subnet1
resource "aws_subnet" "aws-public-subnet1-app1" {
  vpc_id     = aws_vpc.aws-vpc-app1.id
  cidr_block = var.aws-public-subnet1-app1
  availability_zone = var.AZ-1
  map_public_ip_on_launch = true
  tags = {
    Name = "aws-public-subnet1-app1"
  }
}

# Public subnet2
resource "aws_subnet" "aws-public-subnet2-app1" {
    vpc_id     = aws_vpc.aws-vpc-app1.id
    cidr_block = var.aws-public-subnet2-app1
    availability_zone = var.AZ-2
    map_public_ip_on_launch = true
    tags = {
      Name = "aws-public-subnet2-app1"
    }
}
