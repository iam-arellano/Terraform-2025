   provider "aws" {
     region = "us-east-1"  # Set your desired AWS region
   }

   # for ec2 instance
   resource "aws_instance" "my_ec2" {
     ami           = var.ami_value# Specify an appropriate AMI ID
     instance_type = var.instance_type_value   # Specs of your instance
     key_name = var.key_name_value # Key pair of your instance

     tags = {                      # Name of your instance
     Name = "my_ec2_instance"
    }

   }