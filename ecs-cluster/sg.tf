
## SG for ECS Container Instances
resource "aws_security_group" "ecs_container_instance" {
  name        = "${var.namespace}_ECS_Task_SecurityGroup"
  description = "Security group for ECS task running on Fargate"
  vpc_id      = aws_vpc.default.id

  ingress {
    description     = "Allow ingress traffic from ALB on HTTP only"
    from_port       = var.container_port
    to_port         = var.container_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    description = "Allow all egress traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "${var.namespace}_ECS_Task_SecurityGroup"
  }
}


## SG for ALB
resource "aws_security_group" "alb" {
  name        = "${var.namespace}_ALB_SecurityGroup"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.default.id

  ingress {
    description = "Allow all ingress traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all egress traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "${var.namespace}_ALB_SecurityGroup"
  }
}
