output "alb_dns" {
    value = aws_lb.aws-lb-app1.dns_name
    description = "url for instances"  
}
output "asg" {
    value = aws_autoscaling_group.aws-asg-app1.name
    description = "name of asg"
}