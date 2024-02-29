resource "aws_ecr_repository" "this" {
  name                 = var.name
  image_tag_mutability = "MUTABLE" # Set to mutable to put the tag "latest" on the most recent image

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}