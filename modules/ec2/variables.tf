variable "ec2_atributos" {
  description = "ami, instance type and keyname for ec2"
  type = object({
    ami_webserver =  string
    ami_dbserver = string
    instance_type_dbserver = optional(string, "t2.micro")
    instance_type_webserver = optional(string, "t2.micro")
    keyname = optional(string, "terraform-ec2-testes")
    role = optional(string)
  })
}

variable "security_group_webserver" {
  description = "SG utilizado para ec2 webserver"
  type = list(string)
}

variable "security_group_dbserver" {
  description = "SG utilizado para ec2 dbserver"
  type = list(string)
}

variable "subnet_id" {
  description = "ID da subnet que sera atrelado a EC2"
  type = string
}