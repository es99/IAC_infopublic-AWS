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