module "ecr" {
  source = "../modules/ecr"

  name = var.project_name
}