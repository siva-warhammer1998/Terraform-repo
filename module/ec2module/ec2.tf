variable "ec2module" {
  type = string
}
resource "aws_instance" "EC2" {
    ami = "ami-026b57f3c383c2eec"
    instance_type = "t2.micro"
    tags = {
      Name = var.ec2module
    }
}

output "instance_id" {
  value = aws_instance.EC2.id
}