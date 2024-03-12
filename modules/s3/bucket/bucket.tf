# create s3 bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = merge(
    { "Project" = var.project_name },
    { "Environment" = var.environment },
    var.bucket_tags,
  )
}