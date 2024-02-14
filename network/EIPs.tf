
# Create EIPs for 
resource "aws_eip" "eip" {
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]

  count = local.azs_count
  tags = {
    Name = "eip-${element(var.azs_names, count.index)}"
  }
}
