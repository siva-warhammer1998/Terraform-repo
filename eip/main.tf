provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "EC2" {
    ami = "ami-026b57f3c383c2eec"
    instance_type = "t2.micro"
    tags = {
      Name = "firstEC2Terra"
    }
}
//main use of ip is to allocate a specific public ip so that even if ec2 is restarted ip will not change
resource "aws_eip" "myEIP" {
  instance = aws_instance.EC2.id
  vpc = true
}

output "EIPIP" {
  value = aws_eip.myEIP.public_ip
}