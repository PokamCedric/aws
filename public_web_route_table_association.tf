
# Associate the public-web-route table to the public-web-subnets
resource "aws_route_table_association" "igw" {
  count = length(var.public_web_subnets_cidr)
  subnet_id = element(aws_subnet.public-web-subnet[*].id, count.index)
  route_table_id = aws_route_table.internet_route.id
}
