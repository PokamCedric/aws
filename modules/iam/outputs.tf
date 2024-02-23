
################################################################################
# IAM
################################################################################
output "role" {
  value       = var.role
  description = "iam role"
}

output "policy" {
  value       = var.policy
  description = "iam policy"
}
