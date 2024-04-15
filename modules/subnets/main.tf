resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.subnet_vpc_id //ID da VPC
  cidr_block              = var.subnets_cidr.public
  map_public_ip_on_launch = true

  tags = var.subnet_tags
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = var.subnet_vpc_id
  cidr_block        = var.subnets_cidr.private


  tags = var.subnet_tags
}

resource "aws_route_table" "public_route" {
  vpc_id = var.subnet_vpc_id //ID da VPC

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet-gateway-id
  }

  tags = var.subnet_tags
}

resource "aws_route_table_association" "publicSubnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table" "private_route" {
  vpc_id = var.subnet_vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat-gw-id
  }

  tags = var.subnet_tags
}

resource "aws_route_table_association" "privateSubnet" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route.id
}