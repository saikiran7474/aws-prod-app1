# Private subnet1
resource "aws_subnet" "aws-private-subnet1-app1" {
  vpc_id     = aws_vpc.aws-vpc-app1.id
  cidr_block = var.aws-private-subnet1-app1
  availability_zone = var.AZ-1
  tags = {
    Name = "aws-private-subnet1-app1"
  }
}
# Private subnet2
resource "aws_subnet" "aws-private-subnet2-app1" {
    vpc_id     = aws_vpc.aws-vpc-app1.id
    cidr_block = var.aws-private-subnet2-app1
    availability_zone =var.AZ-2
    tags = {
      Name = "aws-private-subnet2-app1"
    }
}
