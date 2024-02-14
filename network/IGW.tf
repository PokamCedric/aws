
# Create IGW for the VPC
resource "aws_internet_gateway" "igw" {
  depends_on = [aws_vpc.vpc]

  vpc_id = aws_vpc.vpc.id
}
