
output "count-azs" {
  value = length(data.aws_availability_zones.azs.names)
}

output "azs-1" {
  value = data.aws_availability_zones.azs.names[0]
}

output "azs-2" {
  value = data.aws_availability_zones.azs.names[1]
}

output "azs-3" {
  value = data.aws_availability_zones.azs.names[2]
}

