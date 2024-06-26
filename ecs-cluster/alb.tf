## Application Load Balancer in public subnets with HTTP default listener that redirects traffic to HTTPS
resource "aws_lb" "alb" {
  name            = "${var.namespace}-ALB"
  security_groups = [aws_security_group.alb.id]
  subnets         = aws_subnet.public.*.id
}


## Target Group for our service
resource "aws_lb_target_group" "service_target_group" {
  name                 = "${var.namespace}-TargetGroup"
  port                 = var.container_port
  protocol             = "HTTP"
  vpc_id               = aws_vpc.default.id
  deregistration_delay = 5
  target_type          = "ip"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 60
    matcher             = var.healthcheck_matcher
    path                = var.healthcheck_endpoint
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 30
  }

  depends_on = [aws_lb.alb]
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP" 


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.service_target_group.arn
  }
  depends_on = [ aws_lb_target_group.service_target_group, aws_lb.alb ]
}

# Output the ALB DNS name for convenience
output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}