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
