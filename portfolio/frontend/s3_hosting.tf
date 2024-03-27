module "hosting" {
  source = "../../modules/s3/hosting"

  bucket_id           = module.s3_bucket_source.id
  bucket_arn          = module.s3_bucket_source.arn
  block_public_access = true
}
