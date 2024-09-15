
# route table for public subnets
resource "aws_route_table" "aws-public-rt-app1" {
  vpc_id = aws_vpc.aws-vpc-app1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws-igw-app1.id
  }
  tags = {
    Name = "aws-public-rt-app1"
  }
}
# associate public subnet1 with public route table
resource "aws_route_table_association" "aws-public-subnet1-rt-association" {
  subnet_id      = aws_subnet.aws-public-subnet1-app1.id
  route_table_id = aws_route_table.aws-public-rt-app1.id
}

# associate public subnet2 with public route table
resource "aws_route_table_association" "aws-public-subnet2-rt-association" {
  subnet_id      = aws_subnet.aws-public-subnet2-app1.id
  route_table_id = aws_route_table.aws-public-rt-app1.id
}


