output "subnet_public_cidr" {
  value = module.subnets.public_subnet-CIDR
}

output "subnet_private_cidr" {
  value = module.subnets.private_subnet-CIDR
}

output "public_subnet_id" {
  value = module.subnets.public_subnet-ID
}

output "private_subnet_id" {
  value = module.subnets.private_subnet-ID
}

output "ec2-webserver-id" {
  value = module.ec2.ec2-webserver-id
}

output "ec2-dbserver-id" {
  value = module.ec2.ec2-dbserver-id
}

output "ec2-webserver-public-ipaddress" {
  value = module.ec2.ec2-webserver-public-ipaddress
}

output "ec2-dbserver-public-ipaddress" {
  value = module.ec2.ec2-dbserver-public-ipaddress
}

output "ec2-dbserver-private-ipaddress" {
  value = module.ec2.ec2-dbserver-private-ipaddress
}

output "ec2-webserver-private-ipaddress" {
  value = module.ec2.ec2-webserver-private-ipaddress
}

output "ec2-webserver-publicdns" {
  value = module.ec2.ec2-webserver-publicdns
}

output "ec2-dbserver-publicdns" {
  value = module.ec2.ec2-dbserver-publicdns
}

output "ec2-keyname" {
  value = module.ec2.ec2-keyname
}

output "ec2_assumed_role-DBServer" {
  value = module.ec2.ec2_assumed_role-DBServer
}

output "ec2_assumed_role-Webserver" {
  value = module.ec2.ec2_assumed_role-Webserver
}

output "eip_webserver" {
  value = module.vpc.eip_webserver_ipaddress
}

output "eip_dbserver" {
  value = module.vpc.eip_dbserver_ipaddress
}

output "instance_type-DBServer" {
  value = module.ec2.instance_type_dbserver
}

output "instance_type-WebServer" {
  value = module.ec2.instance_type_webserver
}