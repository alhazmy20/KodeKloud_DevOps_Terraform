terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.25.0"
    }
  }
}
provider "aws" {
  region = lookup(var.region, terraform.workspace)
}
