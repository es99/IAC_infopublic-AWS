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

module "ec2" {
  source = "./modules/ec2"

  ec2_atributos = {
    ami_dbserver  = data.aws_ami.windows_servers.id
    ami_webserver = data.aws_ami.windows_servers.id
  }

  security_group_dbserver  = [module.security_groups.sg-dbserver-ID]
  security_group_webserver = [module.security_groups.sg-webapp-ID]
  subnet_id                = module.subnets.public_subnet-ID
}