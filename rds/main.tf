provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "myRDS" {
  allocated_storage    = 10
  db_name              = "myTESTdb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "password"
  port = 3306
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  
}