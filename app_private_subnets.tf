# local
locals {
  subnets_count = length(var.private_subnets_list) * length(var.private_subnets_list[0].cidrs)
}

# Create private-app-subnets
resource "aws_subnet" "private_subnets" {

  depends_on = [aws_subnet.public_web_subnet]

  count                   = local.subnets_count
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.private_subnets_list[floor(count.index / length(var.private_subnets_list[0].cidrs))].cidrs,
  count.index % length(var.private_subnets_list[0].cidrs))
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index % length(var.private_subnets_list[0].cidrs))
  map_public_ip_on_launch = false
  tags = {
    Name = "private-${var.private_subnets_list[floor(count.index / length(var.private_subnets_list[0].cidrs))].name}-subnet-${
	element(data.aws_availability_zones.azs.names, count.index % length(var.private_subnets_list[0].cidrs))}"
  }
}

output "count-priv-subnets" {
  value = local.subnets_count
}
