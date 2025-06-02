# EC2 

ami_value = "ami-084568db4383264d4" 
instance_type_value = "t2.micro"
key_name_value =  "raemond-ec2-pem"
ec2_name_value =  "ec2"

## VPC
vpc_name_tags_value = "my_vpc"
cidr_block_value = "10.0.0.0/16"

# VPC - Subnet
cidr_block_subnet_value = "10.0.1.0/24"
zone_value = "us-east-1a"
subnet_name_value = "public_subnet_1"

# VPC - INTERNET GATEWAY FOR PUBLIC SUBNET
internet_gateway_value = "my_internet_gw"

# VPC - ROUTE TABLE
route_table_name_value = "my_route_table"

# SECURITY GROUP
sg_name_value = "my_sg"