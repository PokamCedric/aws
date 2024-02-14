
# Associate the public-web-route table to the public-web-subnets
resource "aws_route_table_association" "public" {
  depends_on = [
    aws_subnet.public,
    aws_route_table.public
  ]

  count          = local.public_subnets_count
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}
