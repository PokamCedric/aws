


# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "app-vpc"
  }
}
# Declare the data source
data "aws_availability_zones" "azs" {
  state = "available"
}

# Create a public-web-subnets
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

# Create a private-app-subnets
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

# Create a private-db-subnets
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
