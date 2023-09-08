terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.15.0"
    }
  }
  cloud {
    organization = "ayyub-demo"

    workspaces {
      name = "terraform-executions"
    }
  }
}
