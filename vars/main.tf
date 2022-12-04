provider "aws" {
  region = "us-east-1"
}

variable "no_of_servers"{
    type = number
}

resource "aws_instance" "dbserver" {
    ami = "ami-026b57f3c383c2eec"
    instance_type = "t2.micro"
    count = var.no_of_servers
} 