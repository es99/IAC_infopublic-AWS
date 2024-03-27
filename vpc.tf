resource "aws_vpc" "main" {
  cidr_block           = "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "infra_ts_vpc"

  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "infra_ts_internet-gw"

  }
}

resource "aws_eip" "ip_nat_gw" {
  domain = "vpc"

  tags = {
    Name = "nat-gw"

  }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.ip_nat_gw.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "gw NAT"

  }

  depends_on = [aws_internet_gateway.gw]
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.10.0/24"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "publicSubnet-192.168.10.0/24"

  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.20.0/24"
  availability_zone = var.availability_zone

  tags = {
    Name = "privateSubnet-192.168.20.0/24"

  }
}