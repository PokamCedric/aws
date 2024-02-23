output "environment" {
  value       = var.environment
  description = "Environment name"
}

################################################################################
# Bucket
################################################################################
output "bucket_name" {
  value       = var.bucket_name
  description = "Bucket name"
}

output "bucket_tags" {
  value = {}
}

################################################################################
# Object
################################################################################
output "file_source_path" {
  value       = var.file_source_path
  description = "File Source Path"
}

output "file_destination_path" {
  value       = var.file_destination_path
  description = "File Destination Path"
}
