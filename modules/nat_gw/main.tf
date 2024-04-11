resource "aws_eip" "ip_nat_gw" {
  domain = "vpc"

  tags = var.gateways_tags
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.ip_nat_gw.id
  subnet_id     = var.public_subnet_id

  tags = var.gateways_tags

  depends_on = [aws_internet_gateway.gw]
}
