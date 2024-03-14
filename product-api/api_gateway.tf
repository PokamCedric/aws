module "aws_api_gateway" {
  source = "../modules/api_gateway"

  resource        = var.resource
  api_description = var.api_description
  methods         = ["POST"]
  stage_name      = "dev"
  inegration_uri  = aws_lambda_function.CreateProduct.invoke_arn
}

output "url" {
  value = "${module.aws_api_gateway.deployment_invoke_url}/${var.resource}"
}