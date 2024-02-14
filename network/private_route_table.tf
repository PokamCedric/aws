
# Create Nat-GW route for each NAT-GW
resource "aws_route_table" "private" {

  depends_on = [aws_nat_gateway.nat_gw]

  count  = local.azs_count
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_nat_gateway.nat_gw[*].id, count.index)
  }
  tags = {
    Name = "private-route-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}
