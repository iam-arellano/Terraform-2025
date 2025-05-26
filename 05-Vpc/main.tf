provider "aws" {
   region = "us-east-1" 
}


# Creating VPC,name, CIDR and Tags
resource "aws_vpc" "dev" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
#   enable_classiclink   = "false"
  tags = {
    Name = "my_vpc"
  }
}

# Creating Public Subnets in VPC    
resource "aws_subnet" "dev-public-1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-public-1"
  }
}

# Creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "dev-gw" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "my_internet_gateway"
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
    Name = "my_route-table_public"
  }
}

# Creating Route Associations public subnets
resource "aws_route_table_association" "dev-public-1-a" {
  subnet_id      = aws_subnet.dev-public-1.id
  route_table_id = aws_route_table.dev-public.id
}




# Creating EC2 instances in public subnets
# resource "aws_instance" "public_inst_1" {
#   ami           = "ami-0c1a7f89451184c8b"
#   instance_type = "t2.micro"
#   subnet_id = "${aws_subnet.dev-public-1.id}"
#   key_name = "raemond"
#   tags = {
#     Name = "my_instance_1"
#   }
# }

# https://www.youtube.com/watch?v=LSz9VbdCPR0&list=PLdsu0umqbb8NxoJUNup3PCb38RQpQtm9p&index=3