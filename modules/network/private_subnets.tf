# local
locals {
  private_subnets_types_count = length(var.private_subnets)
  private_subnets_count       = local.private_subnets_types_count * local.azs_count
}

# Create private-app-subnets
resource "aws_subnet" "private" {

  depends_on = [aws_subnet.public]

  count                   = local.private_subnets_count
  vpc_id                  = aws_vpc.this.id
  cidr_block              = element(var.private_subnets[floor(count.index / local.azs_count)].cidrs, count.index % local.azs_count)
  availability_zone       = element(var.azs_names, count.index % local.azs_count)
  map_public_ip_on_launch = false
  tags = {
    Name = "private-${var.private_subnets[floor(count.index / local.azs_count)].name}-subnet-${element(var.azs_names, count.index % local.azs_count)}"
  }
}

output "count-private-subnets" {
  value = local.private_subnets_count
}
