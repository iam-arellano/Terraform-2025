
# Creating VPC,name, CIDR and Tags
resource "aws_vpc" "dev" {
  cidr_block           = var.cidr_block_value
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
#   enable_classiclink   = "false"
  tags = {
    Name = var.vpc_name_tags_value
  }
}

# Creating Public Subnets in VPC    
resource "aws_subnet" "dev-public-1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.cidr_block_subnet_value
  map_public_ip_on_launch = "true"
  availability_zone = var.zone_value

  tags = {
    Name = var.subnet_name_value
  }
}

# Creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "dev-gw" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = var.internet_gateway_value
  }
}

# Creating Route Tables for Internet gateway
resource "aws_route_table" "dev-public" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-gw.id
  }

  tags = {
    Name = var.route_table_name_value
  }
}

# Creating Route Associations public subnets
resource "aws_route_table_association" "dev-public-1-a" {
  subnet_id      = aws_subnet.dev-public-1.id
  route_table_id = aws_route_table.dev-public.id
}




