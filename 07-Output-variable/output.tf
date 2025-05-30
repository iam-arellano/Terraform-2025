output "public_ip" {
value =aws_instance.ec2.public_ip
description = "show ec2 public ip"
}

output "public_dns" {
value = aws_instance.ec2.public_dns
description = "show public dns"  
}