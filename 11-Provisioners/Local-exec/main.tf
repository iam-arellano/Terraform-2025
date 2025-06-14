provider "aws" {
  region = "us-east-1"
}

   resource "aws_instance" "my_instance" {
     ami           = "ami-0731becbf832f281e"                   # Specify an appropriate AMI ID
     instance_type = "t2.micro"                                # Specs of your instance
     key_name = "raemond-ec2-pem"                              # Key pair of your instance


  provisioner "local-exec" {
    command = "echo ${aws_instance.my_instance.public_ip} >> public_ip.txt"
  }

#   connection {
#       type        = "ssh"
#       host        = self.public_ip
#       user        = "ubuntu"
#       private_key = file("C:/Directory/my_private_key")            # location of private key
#       timeout     = "4m"
#    }

     tags = {                      # Name of your instance
     Name = "my_instance_provisioner"
    }

  }


   

