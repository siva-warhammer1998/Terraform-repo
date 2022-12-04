provider "aws" {
  region = "us-east-1"
}

module "ec2module" {
  source = "./ec2module"
  ec2module = "Name from EC2 Module"
}

output "module_output" {
  value = module.ec2module.instance_id
}