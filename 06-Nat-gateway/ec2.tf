
# Creating EC2 instances in public subnets
resource "aws_instance" "public_intance" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.dev-public-1.id}"
  key_name = "raemond-ec2-pem"
  associate_public_ip_address = true # allow public ip
  tags = {
    Name = "my_instance_public"
  }
}

# Creating EC2 instances in private subnets
resource "aws_instance" "private_instance" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.dev-private-1.id}"
  key_name = "raemond-ec2-pem"
  associate_public_ip_address = false # disable public ip
  tags = {
    Name = "my_instance_private"
  }
}



