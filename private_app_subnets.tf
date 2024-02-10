
# Create private-app-subnets
resource "aws_subnet" "private-app-subnet" {
  count                   = length(var.private_app_subnets_cidr)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_app_subnets_cidr[count.index]
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "private-app-subnet-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}
