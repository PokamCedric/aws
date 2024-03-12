
resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = module.s3_bucket_source.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "GET"]
    allowed_origins = [
      "https://${module.root_a.record_fqdn}",
      "http://${module.root_a.record_fqdn}",
      "https://${module.www_a.record_fqdn}",
      "http://${module.www_a.record_fqdn}"
    ]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}