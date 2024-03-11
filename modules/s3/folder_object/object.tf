### cli
# aws s3 cp personal-blog/src/_site/ s3://www.my-awesome-site.com/ --recursive

##### will upload all the files present under HTML folder to the S3 bucket #####
resource "aws_s3_object" "upload_object" {
  for_each     = fileset(var.file_source_path, "**")
  bucket       = var.bucket
  key          = each.key
  source       = "${var.file_source_path}/${each.key}"
  etag         = filemd5("${var.file_source_path}/${each.key}")
  content_type = "text/html"
}

/*
> fileset(path.module, "files/*.txt")
[
  "files/hello.txt",
  "files/world.txt",
]

> fileset(path.module, "files/{hello,world}.txt")
[
  "files/hello.txt",
  "files/world.txt",
]

> fileset("${path.module}/files", "*")
[
  "hello.txt",
  "world.txt",
]

> fileset("${path.module}/files", "**")
[
  "hello.txt",
  "world.txt",
  "subdirectory/anotherfile.txt",
]

*/