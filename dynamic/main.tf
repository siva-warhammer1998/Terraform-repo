provider "aws" {
    region = "us-east-1"
}

variable "ingressrules" {
  type = list(number)
  default = [22,443]
}

variable "egressrules" {
  type = list(number)
  default = [22,443,80,53,8080]
}

resource "aws_instance" "EC2" {
    ami = "ami-026b57f3c383c2eec"
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.inputOutput.name ]
    tags = {
      Name = "firstEC2Terra"
    }
}
//from to is the range of ports through which the conenction is permitted
resource "aws_security_group" "inputOutput" {
  name = "allows_HTTPS"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
   //example of dynamic value allocation in terraform
  dynamic "egress" {
    
    iterator = port
    for_each = var.egressrules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    } 
  
}
}