
# Create public-web-route table and associate this to the public-web-subnets
resource "aws_route_table" "internet_route" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-web-route-table"
  }
}
