terraform {
  backend "s3" {
    bucket = "alexkilla-terraform-state"
    key    = "staging/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = "us-east-1"
  version = "~> 3.9"
}

module "mysql-db" {
  source = "../modules/rds_my_sql"
  db_password = var.db_password
}

module "web-server" {
  source = "../modules/services/web_server"
  db_address = module.mysql-db.address
  db_port = module.mysql-db.port
}
