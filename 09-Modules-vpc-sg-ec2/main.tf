provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source            = "./modules_folder/vpc"
  vpc_cidr          = "10.0.0.0/16"
  subnet_cidr       = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

module "security_group" {
  source  = "./modules_folder/sg"
  vpc_id_value  = module.vpc.vpc_id       #  connection resource "aws_security_group" "instance_sg"
}

module "ec2_instance" {
  source             = "./modules_folder/ec2"
  ami_id             = "ami-084568db4383264d4"  # Replace with valid AMI
  instance_type      = "t2.micro"
  subnet_id          = module.vpc.subnet_id
  security_group_id  = module.security_group.security_group_id
  key_name           = "raemond-ec2-pem"            # Replace with your key
  instance_name      = "ec2_module"
}
