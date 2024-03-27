terraform {
  backend "s3" {
    bucket = "estudosterraform-engels"
    key    = "infra-infopublic.tfstate"
    region = "us-east-2"
  }
}