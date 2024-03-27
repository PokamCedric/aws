output "s3_bucket_id" {
  value = module.hosting.s3_bucket_id
}

output "s3_bucket_id2" {
  value = var.bucket_id
}


// s3_website_endpoint = "portfolio-dev-bucket-251005264036.s3.us-east-1.amazonaws.com"
output "s3_website_endpoint" {
  value = module.s3_bucket_source.bucket_regional_domain_name
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}


output "website_url" {
  value = "https://${module.root_a.record_fqdn}"
}

// website_url2 = "https://www.cedricpokam.com"
output "website_url2" {
  value = join("", ["https://", var.record_name, ".", var.domain_name])
}

