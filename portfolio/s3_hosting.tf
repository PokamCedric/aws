module "hosting" {
  source = "../modules/s3/hosting"

  bucket_id = module.s3_bucket_source.id
  bucket_arn = module.s3_bucket_source.arn
}

output "s3_bucket_id" {
  value = module.hosting.s3_bucket_id
}