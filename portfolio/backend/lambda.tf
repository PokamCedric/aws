module "lambda" {
  source = "../../modules/lambda"

  # archive_file
  source_dir = "${path.module}/python/"
  output_path = "${path.module}/dist/lambda-function.zip"

  # aws_lambda_function
  function_name = "Visitor_Counter"
  handler       = "LambdaFunction.lambda_handler"
  runtime       = "python3.8"
  role        = module.lambda_policy.role_arn
  principal   = "apigateway.amazonaws.com"


  # aws_lambda_permission
  source_arn = "${aws_api_gateway_rest_api.visitorCounter.execution_arn}/*"
}
