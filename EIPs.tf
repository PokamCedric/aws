
# Create EIPs for 
resource "aws_eip" "eip" {
  count = length(var.public_web_subnets_cidr)

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "eip-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}
