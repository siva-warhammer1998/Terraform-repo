provider "aws" {
    region = "us-east-1"
}

variable "ingressrules" {
    type = list(number)
    default = [443,80]
}

variable "egressrules" {
    type = list(number)
    default = [443,80]
}

resource "aws_security_group" "allowedIPs" {
  name = "Allows IP specified"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

  }
}

resource "aws_instance" "DBserver" {
    ami = "ami-026b57f3c383c2eec"
    instance_type = "t2.micro"
    tags = {
        Name = "DB Server"
    }
  
}
resource "aws_instance" "Webserver" {
    ami = "ami-026b57f3c383c2eec"
    instance_type = "t2.micro"
    user_data = file("server-script.sh")
    security_groups = [aws_security_group.allowedIPs.name]
    tags = {
        Name = "Web Server"
    }
}
resource "aws_eip" "myEIP" {
  instance = aws_instance.Webserver.id
  vpc = true
}


output "privateIP" {
    value = aws_instance.DBserver.private_ip
}