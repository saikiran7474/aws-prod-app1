# create a route table for private subnet1
resource "aws_route_table" "aws-private-rt-app1" {
  vpc_id = aws_vpc.aws-vpc-app1.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway1-app1.id
  }
  tags = {
    Name = "aws-private-rt-app1"
  }
}
# associate private subnet1 with private route table 
resource "aws_route_table_association" "aws-private-subnet1-rt-association" {
  subnet_id      = aws_subnet.aws-private-subnet1-app1.id
  route_table_id = aws_route_table.aws-private-rt-app1.id
}

# create a route table for private subnet2
resource "aws_route_table" "aws-private-rt2-app1" {
  vpc_id = aws_vpc.aws-vpc-app1.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway2-app1.id
  }
  tags = {
    Name = "aws-private-rt2-app1"
  }
}
# associate private subnet2 with private route table 2
resource "aws_route_table_association" "aws-private-subnet2-rt2-association" {
  subnet_id      = aws_subnet.aws-private-subnet2-app1.id
  route_table_id = aws_route_table.aws-private-rt2-app1.id
}
