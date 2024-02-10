
# Associate the public-web-route table to the public-web-subnets
resource "aws_route_table_association" "igw" {
  depends_on = [
    aws_subnet.public_web_subnet,
    aws_route_table.internet_route
  ]

  count          = length(var.public_web_subnets_cidr)
  subnet_id      = element(aws_subnet.public_web_subnet[*].id, count.index)
  route_table_id = aws_route_table.internet_route.id
}
