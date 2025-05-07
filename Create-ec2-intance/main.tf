   provider "aws" {
     region = "us-east-1"  # Set your desired AWS region
   }

   resource "aws_instance" "my_instance" {
     ami           = "ami-084568db4383264d4"  # Specify an appropriate AMI ID
     instance_type = "t2.micro"    # Specs of your instance
     key_name = "raemond-ec2-pem"  # Key pair of your instance

     tags = {                      # Name of your instance
     Name = "my_instance_2025"
    }

   }

