locals {
  s3_origin_id = "S3-Origin"
}

resource "aws_cloudfront_origin_access_control" "default" {
  name                              = "cloudfront OAC"
  description                       = "Cloudfront Origin Access Control (OAC)"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"

}

# Cloudfront distribution for main s3 site.
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = module.s3_bucket_source.bucket_regional_domain_name
    origin_id                = local.s3_origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.default.id
  }

  comment             = "${var.domain_name} distribution"
  enabled             = true
  is_ipv6_enabled     = true
  http_version        = "http2and3"
  price_class         = "PriceClass_100" # Use only North America and Europe
  default_root_object = "index.html"
  aliases             = concat([var.domain_name], var.alternative_names)

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"] # ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    viewer_protocol_policy = "redirect-to-https"

    min_ttl     = 0
    default_ttl = 60
    max_ttl     = 120
    compress    = true

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.www_redirect.arn
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate_validation.cert_validation.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  tags = {
    Environment = "dev"
  }

}

/*
  A CloudFront function to redirect www-prefixed URLs to the apex domain,
  enhancing user experience and consolidating domain authority.
*/
resource "aws_cloudfront_function" "www_redirect" {
  name    = "${var.project_name}-www-redirect"
  runtime = "cloudfront-js-1.0"
  code    = file("${path.module}/functions/cloudfront_func.js")
  publish = true
}
output "cloudfront_url" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}