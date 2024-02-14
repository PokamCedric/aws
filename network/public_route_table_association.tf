
# Associate the public-web-route table to the public-web-subnets
resource "aws_route_table_association" "igw" {
  depends_on = [
    aws_subnet.public_subnets,
    aws_route_table.internet_route
  ]

  count          = local.public_subnets_count
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.internet_route.id
}
