output "public_subnet-CIDR-block" {
  value = aws_subnet.public_subnet.cidr_block
}

output "private_subnet-CIDR-block" {
  value = aws_subnet.private_subnet.cidr_block
}

output "NAT-gw_privateIP" {
  value = aws_nat_gateway.natgw.private_ip
}

output "NAT-gw_publicIP" {
  value = aws_nat_gateway.natgw.public_ip
}