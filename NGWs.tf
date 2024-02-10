
# Create NAT-Gateways
resource "aws_nat_gateway" "nat_gw" {

  depends_on = [aws_eip.eip]

  count         = length(var.public_web_subnets_cidr)
  allocation_id = element(aws_eip.eip[*].id, count.index)
  subnet_id     = element(aws_subnet.public_web_subnet[*].id, count.index)

  tags = {
    Name = "gw-NAT-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}
