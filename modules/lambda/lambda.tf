data "archive_file" "this" {
  type        = "zip"
  source_dir  = var.source_dir
  output_path = var.output_path
}

resource "aws_lambda_function" "this" {
  function_name = var.function_name
  filename      = data.archive_file.this.output_path
  handler       = var.handler
  runtime       = var.runtime

  environment {
    variables = var.variables
  }

  source_code_hash = data.archive_file.this.output_base64sha256
  role             = var.role
  timeout          = var.timeout
  memory_size      = var.memory_size

  tags = var.tags
}

resource "aws_lambda_permission" "this" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = var.principal
  source_arn    = var.source_arn
}
