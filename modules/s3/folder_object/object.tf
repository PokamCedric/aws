### cli
# aws s3 cp personal-blog/src/_site/ s3://www.my-awesome-site.com/ --recursive

##### will upload all the files present under HTML folder to the S3 bucket #####

locals {
  default_mime_type = "text/plain"
  mime_types = {
    "css"  = "text/css"
    "html" = "text/html"
    "ico"  = "image/vnd.microsoft.icon"
    "jpeg" = "image/jpeg"
    "jpg"  = "image/jpg"
    "js"   = "application/javascript"
    "json" = "application/json"
    "map"  = "application/json"
    "png"  = "image/png"
    "svg"  = "image/svg+xml"
    "txt"  = "text/plain"
  }
}

resource "aws_s3_object" "upload_object" {
  for_each = fileset(var.file_source_path, "**")

  bucket = var.bucket
  key    = each.key
  source = "${var.file_source_path}/${each.key}"
  etag   = filemd5("${var.file_source_path}/${each.key}")

  content_type = lookup(
    tomap(local.mime_types),
    element(split(".", each.key), length(split(".", each.key)) - 1),
    local.default_mime_type
  )
}
