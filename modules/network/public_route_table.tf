
# Create public-web-route table and associate this to the public-web-subnets
resource "aws_route_table" "public" {
  depends_on = [
    aws_vpc.this,
    aws_internet_gateway.igw
  ]

  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}
