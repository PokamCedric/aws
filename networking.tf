
# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "app-vpc"
  }
}

# Get all available AZ's in VPC for master region
data "aws_availability_zones" "azs" {
  state = "available"
}

# Create public-web-subnets
resource "aws_subnet" "public-web-subnet" {
  count                   = length(var.public_web_subnets_cidr)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_web_subnets_cidr[count.index]
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-web-subnet-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}

# Create private-app-subnets
resource "aws_subnet" "private-app-subnet" {
  count                   = length(var.private_app_subnets_cidr)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_app_subnets_cidr[count.index]
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "private-app-subnet-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}

# Create private-db-subnets
resource "aws_subnet" "private-db-subnet" {
  count                   = length(var.private_db_subnets_cidr)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_db_subnets_cidr[count.index]
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "private-db-subnet-${element(data.aws_availability_zones.azs.names, count.index)}"
  }
}

# Create IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

# Create public-web-route table and associate this to the public-web-subnets
resource "aws_route_table" "internet_route" {
  vpc_id            = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-web-route-table"
  }
}

# Associate the public-web-route table to the public-web-subnets
resource "aws_route_table_association" "a" {
  count = length(var.public_web_subnets_cidr)
  subnet_id = element(aws_subnet.public-web-subnet[*].id, count.index)
  route_table_id = aws_route_table.internet_route.id
}
