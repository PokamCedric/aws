module "lambda" {
  source = "../"

  # archive_file
  source_dir  = "${path.root}/lambda/"
  output_path = "${path.root}/dist/lambda.zip"

  # aws_lambda_function
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda.arn
  handler       = "index.handler"
  runtime       = "nodejs18.x"

  variables = {
    DELETE_SOURCE : var.delete_source
    DEST_BUCKET : local.dest_bucket
    DEST_KEY : var.dest_key
    DEST_PREFIX : var.dest_prefix
    MATCH_REGEX : var.match_regex
  }

  tags = var.tags

  source_arn = "arn:aws:s3:::${var.src_bucket}"
}

resource "aws_cloudwatch_log_group" "logs" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = var.cloudwatch_log_retention
  tags              = var.tags
}
