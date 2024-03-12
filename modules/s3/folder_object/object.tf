### cli
# aws s3 cp personal-blog/src/_site/ s3://www.my-awesome-site.com/ --recursive

##### will upload all the files present under HTML folder to the S3 bucket #####

/*
    ..
    application/graphql
    application/javascript
    application/json
    application/ld+json
    application/feed+json
    application/msword (.doc)
    application/pdf
    application/sql
    application/vnd.api+json
    application/vnd.ms-excel (.xls)
    application/vnd.ms-powerpoint (.ppt)
    application/vnd.oasis.opendocument.text (.odt)
    application/vnd.openxmlformats-officedocument.presentationml.presentation (.pptx)
    application/vnd.openxmlformats-officedocument.spreadsheetml.sheet (.xlsx)
    application/vnd.openxmlformats-officedocument.wordprocessingml.document (.docx)
    application/x-www-form-urlencoded
    application/xml
    application/zip
    application/zstd (.zst)
    audio/mpeg
    audio/ogg
    image/apng
    image/gif
    image/jpeg
    image/png
    image/svg+xml (.svg)
    multipart/form-data
    text/css
    text/csv
    text/html
    text/php
    text/plain
    text/xml
    ...
*/

# maybe types like less -> binary/octet-stream
locals {
  default_mime_type = "text/plain"
  mime_types = {
    "css"   = "text/css"
    "eot"   = "application/vnd.ms-fontobject",
    "html"  = "text/html"
    "gif"   = "image/gif",
    "ico"   = "image/vnd.microsoft.icon"
    "jpeg"  = "image/jpeg"
    "jpg"   = "image/jpg"
    "js"    = "application/javascript"
    "json"  = "application/json"
    "map"   = "application/json"
    "otf"   = "font/otf"
    "png"   = "image/png"
    "svg"   = "image/svg+xml"
    "ttf"   = "font/ttf",
    "txt"   = "text/plain"
    "webp"  = "image/webp",
    "woff"  = "font/woff",
    "woff2" = "font/woff2",
    "xml"   = "application/xml",
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
