

module "bucket" {
  source = "./bucket"

  environment  = var.environment
  project_name = var.project_name

  bucket_name = var.bucket_name
  bucket_tags = var.bucket_tags

}

module "object" {
  source = "./object"

  depends_on            = [module.bucket]
  bucket                = module.bucket.id
  file_source_path      = var.file_source_path
  file_destination_path = var.file_destination_path
}
