variable "dbserver" {
  type = string
}
resource "aws_instance" "DBserver" {
    ami = "ami-026b57f3c383c2eec"
    instance_type = "t2.micro"
    security_groups = [module.securityModule.sg_name]
    tags = {
        Name = var.dbserver
    }
  
}

output "dbserverPublicIP" {
  value = aws_instance.DBserver.private_ip
}

module "securityModule" {
  source = "../securitygroup"
}