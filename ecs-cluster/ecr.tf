## Container registry for the service's Docker image

# resource "aws_ecr_repository" "demo_ecr_repo" {
#   name                 = "${var.namespace}-ecr"

#   encryption_configuration {
#     encryption_type = "AES256"
#   }
#   image_scanning_configuration {
#     scan_on_push = true
#   }

#   tags = {
#     purpose = "demo"
#   }
# }

# output "aws_ecr_repository_url"  {
#   value = aws_ecr_repository.demo_ecr_repo.repository_url
# }