   provider "aws" {
     region = "us-east-1"  # Set your desired AWS region
   }

   # for ec2 instance
   resource "aws_instance" "ec2" {
     ami           = var.ami_value                                         # Specify an appropriate AMI ID
     instance_type = var.instance_type_value                               # Specs of your instance
     subnet_id = "${aws_subnet.dev-public-1.id}"     
     vpc_security_group_ids = [aws_security_group.my_sg_2025.id]           # Connection to your VPC Subnet
    #  security_groups = [ aws_security_group.my_sg_2025.name ]          # Connection to your SG
     key_name = var.key_name_value                                         # Key pair of your instance
     associate_public_ip_address = true
     tags = {                                                              # Name of your instance
     Name = var.ec2_name_value
    }

   }