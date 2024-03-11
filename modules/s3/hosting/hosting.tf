## https://developer.hashicorp.com/terraform/tutorials/applications/cloudflare-static-website?variants=cdn%3Acloudflare

resource "aws_s3_bucket_public_access_block" "site" {
  bucket = var.bucket_id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = var.bucket_id

  index_document {
    suffix = "index.html"
  }

  #   error_document {
  #   key = "error.html"
  #   }
}

resource "aws_s3_bucket_ownership_controls" "site" {
  bucket = var.bucket_id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "site" {
  bucket = var.bucket_id

  acl = "public-read"
  depends_on = [
    aws_s3_bucket_ownership_controls.site,
    aws_s3_bucket_public_access_block.site
  ]
}

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