# Associate the private-app-route table to private-route
resource "aws_route_table_association" "private" {

  depends_on = [
    aws_subnet.private,
    aws_route_table.private
  ]

  count          = local.public_subnets_empty  ? 0 : local.private_subnets_count
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = element(aws_route_table.private[*].id, count.index % local.azs_count)
}
