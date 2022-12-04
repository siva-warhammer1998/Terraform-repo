provider "aws" {
    region = "us-east-1"
}

variable "vpcname" {
    type = string
    default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}
 variable "myList" {
    type = list(string)
    default = ["Value1","Value2","Value3"]
 }

variable "myMap" {
    type = map
    default = {
        Key1 = "Value1"
        Key2 = "Value2"
    }
}
//input variable set 
variable "inputname" {
    type = string
    description = "Set the name of VPC"
}


resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = var.inputname

    }    
  
}
//this way we can access info about the create datatypes and stuff
output "vpcname" {
    value = aws_vpc.myvpc.id
  
}
// tuple declaration
output "mytuple" {
    type = tuple([string,number,string])
    default = ["cat" , 1 , "dog"]
}

output "myObject" {
    type = object({ name = string, port = list(number)})
    default = {
        name = "Siva"
        port = [22,25,80]
    }
}
