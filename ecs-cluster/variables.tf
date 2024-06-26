
variable "namespace" {
  description = "Namespace for resource names"
  default     = "demo"
  type        = string
}


## Service variables
variable "service_name" {
  description = "A Docker image-compatible name for the service"
  default = "demo-app"
  type        = string
}


## Network variables
variable "vpc_cidr_block" {
  description = "CIDR blo ck for the VPC network"
  default     = "10.1.0.0/16"
  type        = string
}

variable "az_count" {
  description = "Describes how many availability zones are used"
  default     = 2
  type        = number
}


## ECS variables
variable "ecs_task_desired_count" {
  description = "How many ECS tasks should run in parallel"
  type        = number
  default = 1
}

variable "ecs_task_min_count" {
  description = "How many ECS tasks should minimally run in parallel"
  default     = 1
  type        = number
}

variable "ecs_task_max_count" {
  description = "How many ECS tasks should maximally run in parallel"
  default     = 3
  type        = number
}

variable "ecs_task_deployment_minimum_healthy_percent" {
  description = "How many percent of a service must be running to still execute a safe deployment"
  default     = 50
  type        = number
}

variable "ecs_task_deployment_maximum_percent" {
  description = "How many additional tasks are allowed to run (in percent) while a deployment is executed"
  default     = 200
  type        = number
}


variable "container_port" {
  description = "Port of the container"
  type        = number
  default     = 8080
}

variable "cpu_units" {
  description = "Amount of CPU units for a single ECS task"
  default     = 256
  type        = number
}

variable "memory" {
  description = "Amount of memory in MB for a single ECS task"
  default     = 512
  type        = number
}

variable "image_tag" {
  description = "Version of the Docker Image"
  type = string
}

## ECR
variable "ecr_force_delete" {
  description = "Forces deletion of Docker images before resource is destroyed"
  default     = true
  type        = bool
}

variable "healthcheck_endpoint" {
  description = "Endpoint for ALB healthcheck"
  type        = string
  default     = "/"
}

variable "healthcheck_matcher" {
  description = "HTTP status code matcher for healthcheck"
  type        = string
  default     = "200"
}
