  provider "aws" {
     region = "us-east-1"  # Set your desired AWS region
   }

   resource "aws_instance" "public_ec2" {
     ami           = "ami-084568db4383264d4"     # Specify an appropriate AMI ID
     instance_type = "t2.micro"                  # Specs of your instance
     security_groups = [ aws_security_group.my_sg_2025.name ]     # Connection to your Security Group 
     key_name = "raemond-ec2-pem"                # Key pair of your instance
     associate_public_ip_address = true

     tags = {                                    # Name of your instance
     Name = "my_ec2_2025"
    }

   }

