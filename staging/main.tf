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
  env_name = var.env_name
  cluster_name = var.cluster_name
  db_password = var.db_password
}

module "web-server" {
  source = "../modules/web_server"
  cluster_name = var.cluster_name
  db_address = module.mysql-db.address
  db_port = module.mysql-db.port
  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
}
