variable "instance_name" {
  type = string
}
resource "aws_eip" "myEIP" {
  instance = var.instance_name
}

output "privateIP" {
  value = aws_eip.myEIP.public_ip
}
