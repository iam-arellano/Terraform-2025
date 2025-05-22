provider "aws" {
        region = "us-east-1"
}

module "ec2_instance" {
    source = "./module_folder/ec2"          # folder path of your module
    ami_value = "ami-0e86e20dae9224db8"
    instance_type_value = "t2.micro"
    key_name_value = "raemond-ec2-pem"
    tags_ec2_value = "may_2025"
    
  
}
