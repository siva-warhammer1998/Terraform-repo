variable "ingressrules" {
    type = list(number)
    default = [443,80]
}

variable "egressrules" {
    type = list(number)
    default = [443,80]
}

output "sg_name" {
  value = aws_security_group.allowedIPs.name
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