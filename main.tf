provider "aws" {
  region = "sa-east-1"
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
    ami_dbserver            = "ami-08c23b254ed9db3e2"
    ami_webserver           = "ami-0692d8d70a1ce85bc"
    role                    = var.role_ec2
    webserver_allocation_id = module.vpc.eip_webserver_id
    dbserver_allocation_id  = module.vpc.eip_dbserver_id
    instance_type_webserver = "r7i.xlarge"
    instance_type_dbserver  = "r6i.xlarge"
  }

  security_group_dbserver  = [module.security_groups.sg-dbserver-ID]
  security_group_webserver = [module.security_groups.sg-webapp-ID]
  subnet_id                = module.subnets.public_subnet-ID
}
