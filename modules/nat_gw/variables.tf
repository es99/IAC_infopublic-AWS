variable "gateways_tags" {
  description = "Tags padrao"
  type = map(string)
}

variable "public_subnet_id" {
  description = "ID da rede publica em que o NAT GW sera atrelado"
  type = string
}