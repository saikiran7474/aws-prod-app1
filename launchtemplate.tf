# create launch template
resource "aws_launch_template" "aws-launch-template-app1" {
  name = "aws-launch-template-app1"
  image_id = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.aws-sg-app1.id]
  user_data =filebase64("userdata.sh") 
}
