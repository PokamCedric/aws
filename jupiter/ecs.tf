data "aws_ecr_repository" "ecr_repository" {
  name        = var.project_name
  registry_id = var.registry_id
}

# Filter app subnets
locals {
  app_subnets = toset([for subnet in module.network.out_private_subnets : subnet.id if strcontains(subnet.tags["Name"], "private-app")])
}

module "ecs" {
  source = "../modules/ecs"

  project_name = var.project_name
  environment  = var.environment

  ## cluster ##
  # nothing to do

  ## task definition ##
  container_image        = data.aws_ecr_repository.ecr_repository.repository_url
  container_port_mapping = var.container_port_mapping
  execution_role_arn     = module.iam_execution_role_policy.role_arn
  # Remember if you build a docker (linux) image on Windows select LINUX_X86_64 and if you build on MAC select LINUX_ARM64
  runtime_platform = var.runtime_platform

  ## services ##
  subnet_ids       = local.app_subnets
  security_groups  = [module.container_security_group.id]
  target_group_arn = module.alb.lb_target_group_arn

}