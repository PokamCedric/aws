
# Create Nat-GW route for each NAT-GW
resource "aws_route_table" "private" {

  depends_on = [aws_nat_gateway.nat_gw]

  count  = local.no_public_or_privat_subnets ? 0 : local.azs_count
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_nat_gateway.nat_gw[*].id, count.index)
  }
  tags = {
    Name = "private-route-${element(var.azs_names, count.index)}"
  }
}
