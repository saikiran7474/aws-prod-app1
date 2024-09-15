# create load blanacer
resource "aws_lb" "aws-lb-app1" {
  name               = "aws-lb-app1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.aws-sg-lb-app1.id]
  subnets            = [aws_subnet.aws-public-subnet1-app1.id,aws_subnet.aws-public-subnet2-app1.id] #
  enable_deletion_protection = false
}
# create target group
resource "aws_lb_target_group" "aws-tg-app1" {
  name     = "aws-tg-app1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.aws-vpc-app1.id
  depends_on = [ aws_vpc.aws-vpc-app1 ]

}

# create listener
resource "aws_lb_listener" "aws-listener-app1" {
  load_balancer_arn = aws_lb.aws-lb-app1.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.aws-tg-app1.arn
  }
}

# Create an ALB Target Group attachment
resource "aws_autoscaling_attachment" "aws-asg-app1" {
  autoscaling_group_name = aws_autoscaling_group.aws-asg-app1.id
  lb_target_group_arn    = aws_lb_target_group.aws-tg-app1.arn
}
