output "vpc_id" {
  value = aws_vpc.infopublic.id
}

output "vpc_cidr" {
  value = aws_vpc.infopublic.cidr_block
}

output "IGW_ID" {
  value = aws_internet_gateway.gw.id
}

output "eip_webserver_ipaddress" {
  value = aws_eip.webserver.public_ip
}

output "eip_dbserver_ipaddress" {
  value = aws_eip.dbserver.public_ip
}

output "eip_webserver_id" {
  value = aws_eip.webserver.id
}

output "eip_dbserver_id" {
  value = aws_eip.dbserver.id
}