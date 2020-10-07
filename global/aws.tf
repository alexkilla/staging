provider "aws" {
  region = var.default_region
  version = "~> 3.9"
}

provider "template" { version = "~> 2.1" }

resource "aws_s3_bucket" "terraform_state" {
  bucket = "alexkilla-terraform-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

terraform {
  backend "s3" {
    bucket = "alexkilla-terraform-state"
    key = "global/terraform.tfstate"
    region = "us-east-1"
  }
}