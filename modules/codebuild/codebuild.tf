
resource "aws_codebuild_project" "this" {
  name          = var.project_name
  description   = var.project_description
  build_timeout = 5
  service_role  = module.iam_service_role_policy.role_arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = var.image
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = var.privilege_enabled

    dynamic "environment_variable" {
      for_each = var.environment_variables
      content {
        name  = environment_variable.key
        value = environment_variable.value
      }
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = var.cloudwatch_logs_group_name
      stream_name = var.cloudwatch_logs_stream_name
    }

    s3_logs {
      status   = var.S3_logs_status
      location = var.S3_logs_location
    }
  }

  source {
    type            = var.repository_source.type            # "GITHUB"
    location        = var.repository_source.location        # "https://github.com/mitchellh/packer.git"
    git_clone_depth = var.repository_source.git_clone_depth # 1

    git_submodules_config {
      fetch_submodules = true
    }
  }

  source_version = var.repository_source.version # "master"

  tags = {
    Environment = var.environment
  }
}
