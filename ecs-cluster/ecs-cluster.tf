## Creates an ECS Cluster
resource "aws_ecs_cluster" "default" {
  name = "${var.namespace}_ECSCluster"
  
  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name     = "${var.namespace}_ECSCluster"
  }
}


