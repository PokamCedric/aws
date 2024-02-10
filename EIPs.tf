
# Create EIPs for 
resource "aws_eip" "eip" {
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]

  count = length(var.public_web_subnets_cidr)

  tags = {
    Name = "eip-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}
