   provider "aws" {
     alias = "us-east-1"
     region = "us-east-1"  # Set your desired AWS region
   }

    provider "aws" {
     alias = "us-east-2"
     region = "us-east-2"  # Set your desired AWS region
   }


    resource "aws_instance" "multi-region"  {
     provider = "aws.us-east-1"
     ami           = "ami-084568db4383264d4"  # Specify an appropriate AMI ID
     instance_type = "t2.micro"    # Specs of your instance
     key_name = "raemond-ec2-pem"  # Key pair of your instance
     tags = {                      # Name of your instance
     Name = "my_instance_v1"
    }
    }

    resource "aws_instance" "multi-region-v2" {
    provider = "aws.us-east-2"
     ami = "ami-04f167a56786e4b09"  # Specify an appropriate AMI ID 
     instance_type = "t2.micro"    # Specs of your instance
    #  key_name = "raemond-ec2-pem"  # Key pair of your instance
     tags = {                      # Name of your instance
     Name = "my_instance_v2"
    }
   }

