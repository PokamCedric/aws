# Associate the private-app-route table to private-route
resource "aws_route_table_association" "pra" {

  depends_on = [
    aws_subnet.private_subnets,
    aws_route_table.private_route
  ]

  count                   = length(aws_subnet.private_subnets) // size of the subnets

  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = element(aws_route_table.private_route[*].id, count.index)
}
