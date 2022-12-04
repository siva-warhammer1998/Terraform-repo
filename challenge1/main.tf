provider "aws" {
    region = "us-east-1"
}

variable "vpcname" {
    type = string
    default = "TerraformVPC"
}

resource "aws_vpc" "challenge1VPC" {
    cidr_block = "192.68.0.0/24"
    tags = {
        Name = var.vpcname
    }
  
}