provider "aws" {
  region = "us-east-1"
}

module "servernames" {
  source = "./dbserver"
  servernames = ["Siva","Anu","Hari"]
}

output "privateIPs" {
  value = module.servernames.privateIPS
}