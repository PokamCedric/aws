
# Create NAT-Gateways
resource "aws_nat_gateway" "nat_gw" {
  count         = length(var.public_web_subnets_cidr)
  allocation_id = element(aws_eip.eip[*].id, count.index)
  subnet_id     = element(aws_subnet.public-web-subnet[*].id, count.index)

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "gw-NAT-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}
