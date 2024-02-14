# local
locals {
  azs_count               = length(var.public_subnets[0].cidrs)
  public_subnets_count    = length(var.public_subnets) * length(var.public_subnets[0].cidrs)
}

# Create public-web-subnets
resource "aws_subnet" "public" {
  depends_on = [
    aws_vpc.this
  ]

  count                   = local.public_subnets_count
  vpc_id                  = aws_vpc.this.id
  cidr_block              = element(var.public_subnets[floor(count.index / local.azs_count)].cidrs, count.index % local.azs_count)
  availability_zone       = element(var.azs, count.index % local.azs_count)
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "public-${var.public_subnets[floor(count.index / local.azs_count)].name}-subnet-${element(var.azs, count.index % local.azs_count)}"
  }
}

output "count-public-subnets" {
  value = local.public_subnets_count
}
