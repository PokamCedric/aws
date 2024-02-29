locals {
  is_task_definition_family_present = var.task_definition_family != null && var.task_definition_family != ""
  ecs_task_definition_family        = local.is_task_definition_family_present ? var.task_definition_family : "${var.project_name}-${var.environment}-service"
}

resource "aws_ecs_task_definition" "this" {
  family                   = local.ecs_task_definition_family
  network_mode             = var.network_mode
  requires_compatibilities = var.infrastructures
  cpu                      = var.cpu
  memory                   = var.memory
  # if execution_role_arn is null the ECS will create a ecsTaskExecutionRole as default
  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn
  container_definitions = jsonencode([{
    name      = local.container_name
    image     = "${var.container_image}:${var.container_image_version}"
    essential = true
    # environment  = var.container_environment
    portMappings = [var.container_port_mapping]
  }])

  # Remember if you build a docker (linux) image on Windows select LINUX_X86_64 and if you build on MAC select LINUX_ARM64
  runtime_platform {
    #Valid Values: WINDOWS_SERVER_2019_FULL | WINDOWS_SERVER_2019_CORE | WINDOWS_SERVER_2016_FULL | WINDOWS_SERVER_2004_CORE | WINDOWS_SERVER_2022_CORE | WINDOWS_SERVER_2022_FULL | WINDOWS_SERVER_20H2_CORE | LINUX
    operating_system_family = var.runtime_platform.operating_system

    #Valid Values: X86_64 | ARM64 (<- for Mac)
    cpu_architecture = var.runtime_platform.cpu_architecture
  }

}