variable "servernames" {
  type = list(string)
}

resource "aws_instance" "dbserver" {
    ami = "ami-026b57f3c383c2eec"
    instance_type = "t2.micro"
    count = length(var.servernames)
    tags = {
      Name = var.servernames[count.index]
    }
  
}

output "privateIPS" {
  value = [aws_instance.dbserver.*.private_ip]
}