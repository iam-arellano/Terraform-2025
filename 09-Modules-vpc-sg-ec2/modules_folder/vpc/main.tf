resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

# Creating Public Subnets in VPC    
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id        # connect to resource "aws_vpc" "main"
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
}


# Creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id                         # connect to resource "aws_vpc" "main"
}

resource "aws_route_table" "public" {               # connect to resource "aws_vpc" "main"
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id        # connect to resource "aws_internet_gateway" "igw" 
  }
}

# Creating Route Tables for Internet gateway
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id                 # connect to resource "aws_subnet" "public" 
  route_table_id = aws_route_table.public.id             # connect to resource "aws_route_table" "public" 
}
