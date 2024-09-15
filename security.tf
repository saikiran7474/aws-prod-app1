# create security group for application allow shh and http
resource "aws_security_group" "aws-sg-app1" {
  name        = "aws-sg-app1"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.aws-vpc-app1.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# create security group for load balancer
resource "aws_security_group" "aws-sg-lb-app1" {
  name        = "aws-sg-lb-app1"
  description = "Allow HTTP traffic"
  vpc_id      = aws_vpc.aws-vpc-app1.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

