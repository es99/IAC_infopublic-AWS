resource "aws_vpc" "infopublic" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = var.tags
}

// Cria um Internet Gateway e já o associa a VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.infopublic.id

  tags = var.tags
}