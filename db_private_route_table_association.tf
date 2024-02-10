# Associate the private-db-route table to private-route
resource "aws_route_table_association" "db" {

  depends_on = [
    aws_subnet.private_db_subnet,
    aws_route_table.private_route
  ]

  count          = length(var.private_db_subnets_cidr)
  subnet_id      = element(aws_subnet.private_db_subnet[*].id, count.index)
  route_table_id = element(aws_route_table.private_route[*].id, count.index)
}
