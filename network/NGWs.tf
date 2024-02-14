
# Create NAT-Gateways
resource "aws_nat_gateway" "nat_gw" {

  depends_on = [aws_eip.eip]

  count         = local.azs_count
  allocation_id = element(aws_eip.eip[*].id, count.index)
  subnet_id     = element(aws_subnet.public[*].id, floor(count.index / local.public_subnets_count))
  tags = {
    Name = "gw-NAT-${element(var.azs, count.index)}"
  }
}
