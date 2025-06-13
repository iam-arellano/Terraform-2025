provider "aws" {
  region = "us-east-1"
}

   resource "aws_instance" "my_instance" {
     ami           = "ami-0731becbf832f281e"                   # Specify an appropriate AMI ID
     instance_type = "t2.micro"                                # Specs of your instance
     key_name = "raemond-ec2-pem"                              # Key pair of your instance
     security_groups = [ aws_security_group.my_sg_2025.name ] 


  provisioner "remote-exec" {                                   # To execute your command
    inline = [
      "cd /home/ubuntu",  
      "touch happy_learning.txt",
      "echo 'Keep Exploring new Technologies' >> happy_learning.txt",
      "touch raemond.txt",
      "echo 'hello raemond' >> raemond.txt"
    ]
  }

  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("C:/Directory/my_private_key")                   # location of private key
      timeout     = "4m"
   }

     tags = {                      # Name of your instance
     Name = "my_instance_provisioner"
    }

  }


   

