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