module "lambda" {
  source = "../modules/lambda"

  # archive_file
  source_dir  = "${path.root}/lambda/"
  output_path = "${path.root}/dist/lambda.zip"

  # aws_lambda_function
  function_name = "CreateProduct"
  handler       = "createproduct.lambda_handler"
  runtime       = "python3.8"

  variables = {
    REGION        = var.region
    PRODUCT_TABLE = aws_dynamodb_table.product_table.name
  }

  role        = module.lambda_policy.role_arn
  timeout     = 5 # default timeout is 3s
  memory_size = 128
  principal   = "apigateway.amazonaws.com"

  # aws_lambda_permission
  source_arn = "${module.aws_api_gateway.rest_api_execution_arn}/*/POST/product"
}
