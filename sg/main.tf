provider "aws" {
    region = "us-east-1"
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
  ingress {
    description = "ingress"
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    
  }

  egress {
    description = "egress"
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
    prefix_list_ids = null
    security_groups = null
    self = null
  } 
  
}