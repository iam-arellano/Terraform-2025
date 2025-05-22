provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
    ami = var.ami_value
    instance_type = var.instance_type_value
    key_name = var.key_name_value

    tags = {          # Name of your instance
      Name = var.tags_ec2_value
      }
}