output "ports" {
    description = "List of Ports"
    value = var.ports
}

output "sg_tags" {
  description = "Additional tags for the security group"
  value     = var.sg_tags
}

output "vpc_id" {
  description = "VPC-id"
  value     = var.vpc_id
}

output "sg_name" {
  description = "VPC-id"
  value     = var.sg_name
}

output "sg_desc" {
  description = "VPC-id"
  value     = var.sg_desc
}
