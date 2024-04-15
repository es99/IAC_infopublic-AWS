variable "ec2_ami_webserver" {
  description = "AMI utilizada no webserver"
  type = string
}

variable "instance_type_webserver" {
  description = "Tipo da instancia utilizado no ec2 webserver"
    type = string
    default = "t2.micro"
}

variable "ec2_ami_dbserver" {
  description = "AMI utilizada no webserver"
  type = string
}

variable "instance_type_dbserver" {
  description = "Tipo da instancia utilizado no ec2 dbserver"
    type = string
    default = "t2.micro"
}

variable "key_name" {
  description = "Keyname para acesso"
  type = string
}

variable "security_group_webserver" {
  description = "SG utilizado para ec2 webserver"
  type = list(string)
}

variable "security_group_dbserver" {
  description = "SG utilizado para ec2 dbserver"
  type = list(string)
}

variable "tags" {
  description = "tags a serem utilizadas no recurso"
  type = map(string)
}

variable "subnet_id" {
  description = "ID da subnet que sera atrelado a EC2"
  type = string
}