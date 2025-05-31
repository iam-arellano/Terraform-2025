

# Security group for your ec2 instance


resource "aws_security_group" "my_sg_2025" {
  name        = "my security group aug 2025"
  description = "enable http and ssh access on port 80/22"
#   vpc_id = aws_vpc.myvpc.id                 # Connection to vpc created

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 27017  #port mongodb
    to_port     = 27017  
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all traffic to leave
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {                     
     Name = "my_sg"
    }


}


