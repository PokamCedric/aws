
# Create public-web-subnets
resource "aws_subnet" "public_web_subnet" {
  depends_on = [
    aws_vpc.vpc
  ]

  count                   = length(var.public_web_subnets_cidr)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_web_subnets_cidr[count.index]
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-web-subnet-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}
