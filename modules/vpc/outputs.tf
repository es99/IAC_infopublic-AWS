output "vpc_id" {
  value = aws_vpc.infopublic.id
}

output "vpc_cidr" {
  value = aws_vpc.infopublic.cidr_block
}

output "IGW_ID" {
  value = aws_internet_gateway.gw.id
}