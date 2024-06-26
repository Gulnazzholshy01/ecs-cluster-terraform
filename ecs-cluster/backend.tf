terraform {
  backend "s3" {
    bucket = "tf-session-jan24-backend"
    key    = "ecs-cluster-backend-demo/terraform.tfstate"
    region = "us-east-1"
   }
}