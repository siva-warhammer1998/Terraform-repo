provider "aws" {
    region = "us-east-1"
}

module "dbserver" {
  source = "./dbserver"
  dbserver = "DB-SERVER"
}

module "webserver" {
  source = "./webserver"
  webserver = "WEB-SERVER"
}