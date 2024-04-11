terraform {
  backend "s3" {
    bucket = "estudosterraform-engels"
    key    = "infra-infopublic.tfstate"
    region = "us-east-2"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~ 1.2"
}