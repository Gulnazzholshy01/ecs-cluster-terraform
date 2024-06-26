## Create ECS Task Definition
resource "aws_ecs_task_definition" "default" {
  family                   = "${var.namespace}_ECS_TaskDefinition"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = var.cpu_units
  memory                   = var.memory

  container_definitions = jsonencode([
    {
      name         = var.service_name
      image        = "${data.aws_ecr_repository.ecr.repository_url}:${var.image_tag}"
      cpu          = var.cpu_units
      memory       = var.memory
      essential    = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]
    }
  ])
}