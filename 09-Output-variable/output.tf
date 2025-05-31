output "public_ip" {
value =aws_instance.ec2.public_ip  # name of your resource
description = "show ec2 public ip"
}

output "public_dns" {
value = aws_instance.ec2.public_dns  # name of your resource
description = "show public dns"  
}