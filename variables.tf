variable "availability_zone_a" {
  type        = string
  description = "zona de disponibilidade padrao a ser usada nos recursos aws"
  default     = "us-east-2a"
}

variable "availability_zone_b" {
  type        = string
  description = "zona de disponibilidade padrao a ser usada nos recursos aws"
  default     = "us-east-2b"
}

variable "availability_zone_c" {
  type        = string
  description = "zona de disponibilidade padrao a ser usada nos recursos aws"
  default     = "us-east-2c"
}

variable "tags_infra" {
  description = "Tag a ser utilizada em todos os recursos gerenciados pelo Terraform"
  type = map(string)
  default = {
    Owner = "Terraform"
    Type = "IaC-Infopublic"
    Author = "Engels Souza"
    Contact = "engels.franca@gmail.com"
    Cloud = "AWS"
  }
}