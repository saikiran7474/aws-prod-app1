# create autoscaling group
resource "aws_autoscaling_group" "aws-asg-app1" {
  name                = "aws-asg-app1"
  min_size            = 2
  max_size            = 4
  desired_capacity    = 3
  vpc_zone_identifier = [aws_subnet.aws-private-subnet1-app1.id,aws_subnet.aws-private-subnet2-app1.id] #
  launch_template {
    id = aws_launch_template.aws-launch-template-app1.id
  }
  target_group_arns = [aws_lb_target_group.aws-tg-app1.arn]
}
