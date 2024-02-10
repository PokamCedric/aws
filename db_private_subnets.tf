
# Create private-db-subnets
resource "aws_subnet" "private_db_subnet" {

  depends_on = [aws_subnet.public_web_subnet]

  count                   = length(var.private_db_subnets_cidr)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_db_subnets_cidr[count.index]
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "private-db-subnet-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}
