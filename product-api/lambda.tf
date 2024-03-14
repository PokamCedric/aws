data "archive_file" "lambda" {
  type        = "zip"
  output_path = "${path.module}/dist/lambda.zip"
  source_dir  = "${path.module}/lambda/"
}

resource "aws_lambda_function" "CreateProduct" {
  function_name = "CreateProduct"
  filename      = data.archive_file.lambda.output_path
  handler       = "createproduct.lambda_handler"
  runtime       = "python3.8"

  environment {
    variables = {
      REGION        = var.region
      PRODUCT_TABLE = aws_dynamodb_table.product_table.name
    }
  }

  source_code_hash = data.archive_file.lambda.output_base64sha256
  role             = module.lambda_policy.role_arn
  timeout          = "5" # default timeout is 3s
  memory_size      = "128"

}

resource "aws_lambda_permission" "apigw-CreateProduct" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.CreateProduct.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${module.aws_api_gateway.rest_api_execution_arn}/*/POST/product"
}