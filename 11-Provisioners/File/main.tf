provider "aws" {
  region = "us-east-1"
}

   resource "aws_instance" "my_instance" {
     ami           = "ami-0731becbf832f281e"                   # Specify an appropriate AMI ID
     instance_type = "t2.micro"                                # Specs of your instance
     key_name = "raemond-ec2-pem"                              # Key pair of your instance
     security_groups = [ aws_security_group.my_sg_2025.name ] 


    provisioner "file" {                                            # uploading file or text to remote ec2 instance
    source      = "C:/Raemond-Software/terraform-2025/11-Provisioners/File/hello.txt"        # location for your file   
    destination = "/home/ubuntu/hello.txt"                      # location of your file in remote
  }

  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("C:/Raemond-Software/raemond-ec2-pem.pem")
      timeout     = "4m"
   }

     tags = {                      # Name of your instance
     Name = "my_instance_provisioner"
    }

  }


   

