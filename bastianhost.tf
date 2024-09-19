# create an ec2 instance
resource "aws_instance" "bastianhost" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.aws-public-subnet1-app1.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.aws-sg-app1]
  associate_public_ip_address = true
  tags = {
    Name = "bastianhost"
  }
}