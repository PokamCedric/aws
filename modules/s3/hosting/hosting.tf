## https://developer.hashicorp.com/terraform/tutorials/applications/cloudflare-static-website?variants=cdn%3Acloudflare

locals {
  is_cloudfront = var.cloudfront_distribution_arn != null && var.cloudfront_distribution_arn != ""
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket = var.bucket_id

  block_public_acls       = var.block_public_access
  block_public_policy     = var.block_public_access
  ignore_public_acls      = var.block_public_access
  restrict_public_buckets = var.block_public_access
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = var.bucket_id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "site" {
  bucket = var.bucket_id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "site" {
  bucket = var.bucket_id

  acl = var.block_public_access ? "private" : "public-read"
  depends_on = [
    aws_s3_bucket_ownership_controls.site,
    aws_s3_bucket_public_access_block.site
  ]
}

/*
  When hosting content on an S3 bucket, ensure proper access control.
  The aws_s3_bucket_policy "allow_cloudfront" grants CloudFront read-only access via Origin Access Control (OAC).
  This approach ensures exclusive content access through CloudFront.
*/

resource "aws_s3_bucket_policy" "site" {
  bucket = var.bucket_id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          var.bucket_arn,
          "${var.bucket_arn}/*",
        ]
      },
    ]
  })

  depends_on = [
    aws_s3_bucket_public_access_block.site
  ]
}