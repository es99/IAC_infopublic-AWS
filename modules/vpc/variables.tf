variable "vpc_cidr" {
  description = "CIDR da VPC"
  type = string
  default = "192.168.0.0/16"
}

variable "tags" {
  description = "Tags utilizadas no recurso VPC"
  type = map(string)
}