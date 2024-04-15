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