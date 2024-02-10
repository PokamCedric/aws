# Associate the private-app-route table to private-route
resource "aws_route_table_association" "app" {
  count          = length(var.private_app_subnets_cidr)
  subnet_id      = element(aws_subnet.private-app-subnet[*].id, count.index)
  route_table_id = element(aws_route_table.private_route[*].id, count.index)
}
