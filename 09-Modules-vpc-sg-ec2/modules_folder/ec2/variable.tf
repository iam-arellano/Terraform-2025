variable "ami_id" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "subnet_id" {}
variable "security_group_id" {}
variable "key_name" {}
variable "instance_name" {
  default = "MyInstance"
}
