provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "./modules/vpc"

  tags = var.tags_infra
}

module "subnets" {
  source = "./modules/subnets"

  subnet_vpc_id       = module.vpc.vpc_id
  subnet_tags         = var.tags_infra
  nat-gw-id           = module.nat_gw.nat-gw-id
  internet-gateway-id = module.vpc.IGW_ID

  subnets_cidr = {}
}

module "nat_gw" {
  source = "./modules/nat_gw"

  gateways_tags    = var.tags_infra
  public_subnet_id = module.subnets.public_subnet-ID
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id = module.vpc.vpc_id
}