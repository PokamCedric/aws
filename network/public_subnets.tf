# local
locals {
  azs_count               = length(var.public_subnets_list[0].cidrs)
  public_subnets_count    = length(var.public_subnets_list) * length(var.public_subnets_list[0].cidrs)
}

# Create public-web-subnets
resource "aws_subnet" "public" {
  depends_on = [
    aws_vpc.vpc
  ]

  count                   = local.public_subnets_count
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.public_subnets_list[floor(count.index / local.azs_count)].cidrs, count.index % local.azs_count)
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index % local.azs_count)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-${var.public_subnets_list[floor(count.index / local.azs_count)].name}-subnet-${element(data.aws_availability_zones.azs.names, count.index % local.azs_count)}"
  }
}

output "count-public-subnets" {
  value = local.public_subnets_count
}
