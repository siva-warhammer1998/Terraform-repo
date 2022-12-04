variable "webserver" {
  type = string
}

resource "aws_instance" "Webserver" {
    ami = "ami-026b57f3c383c2eec"
    instance_type = "t2.micro"
    
    security_groups = [module.securityModule.sg_name]
    tags = {
        Name = "Web Server"
    }
}

module "securityModule" {
  source = "../securitygroup"
}

module "eipModule" {
  source = "../eip"
  instance_name = aws_instance.Webserver.id
}