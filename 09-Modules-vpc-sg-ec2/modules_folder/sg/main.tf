resource "aws_security_group" "instance_sg" {
  name        = "instance_sg"       # Name of your sg
  description = "Allow SSH"
  vpc_id      = var.vpc_id_value          # Connection to vpc 

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
