variable "public-subnet_cidr" {
  description = "Public Subnet CIDR"
  type = string
  default = "192.168.40.0/28"
}

variable "private-subnet_cidr" {
  description = "Private Subnet CIDR"
  type = string
  default = "192.168.50.0/28"
}

variable "subnet_tags" {
  description = "Tags do recurso subnet."
  type = map(string)
}

variable "subnet_vpc_id" {
  description = "Qual o VPC que as subnets estao atreladas"
  type = string
}

variable "internet-gateway-id" {
  description = "ID do IGW para ser utilizado nas tabelas de rotas"
  type = string
}

variable "nat-gw-id" {
  description = "ID do NATGW para ser utilizado nas tabelas de rotas"
  type = string
}
