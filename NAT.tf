# create a nat gateway 1
resource "aws_nat_gateway" "nat-gateway1-app1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.aws-public-subnet1-app1.id

  tags = {
    Name = "nat_gateway-1"
  }
}

# create a nat gateway 1
resource "aws_nat_gateway" "nat-gateway2-app1" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.aws-public-subnet2-app1.id

  tags = {
    Name = "nat_gateway-2"
  }
}
# create an elastic ip
resource "aws_eip" "eip1" {
}

resource "aws_eip" "eip2" {
}

