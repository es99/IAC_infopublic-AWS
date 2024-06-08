terraform {
  backend "s3" {
    bucket = "iac-webapps-infopublic"
    key    = "iac-ts_servers.tfstate"
    region = "sa-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.2"
}