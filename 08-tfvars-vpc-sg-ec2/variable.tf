## EC2

variable "ami_value" {
    description = "value for ami"
}

variable "instance_type_value" {
  description = "value for instance type"
}

variable "key_name_value" {
  description = "value for key name"
}

variable "ec2_name_value" {
  description = "name of your ec2"
  
}


## VPC

variable "vpc_name_tags_value" {
  description = "name of your vpc"
}

variable "cidr_block_value" {
    description = "value for cicd block ip range for vpc"
  
}



# VPC - Subnet

variable "cidr_block_subnet_value" {
    description = "value for cidr block ip range for subnet"
}

variable "zone_value" {
    description = "location of your subnet"
  
}

variable "subnet_name_value" {
    description = "name of your subnet"
  
}

# VPC - Internet Gateway
variable "internet_gateway_value" {
    description = "name of your internet gateway"
  
}

# VPC - Route Table
variable "route_table_name_value" {
  description = "name of your route table"
}


## SECURITY GROUP

variable "sg_name_value" {
  description = "name of security group "
  
}