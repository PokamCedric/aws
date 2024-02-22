# local
locals {
  azs_count                   = var.azs_count
  public_subnets_types_count  = length(var.public_subnets)
  no_public_or_privat_subnets = (local.public_subnets_types_count == 0) || (local.private_subnets_count == 0)
  public_subnets_count        = (local.public_subnets_types_count == 0) ? 0 : min(local.azs_count,  local.public_subnets_types_count * length(var.public_subnets[0].cidrs))
}

# Create public-web-subnets
resource "aws_subnet" "public" {
  depends_on = [
    aws_vpc.this
  ]
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = var.public_subnet_map_public_ip_on_launch

  count                   = local.public_subnets_count
  cidr_block              = element(
    var.public_subnets[floor(count.index / local.azs_count)].cidrs, count.index % local.azs_count)
  availability_zone       = element(var.azs_names, count.index % local.azs_count)
  tags = {
    Name = "public-${var.public_subnets[floor(count.index / local.azs_count)].name}-subnet-${element(var.azs_names, count.index % local.azs_count)}"
  }
}

output "count-public-subnets" {
  value = local.public_subnets_count
}
