resource "aws_instance" "webserver" {
  ami = var.ec2_atributos.ami_webserver
  instance_type = var.ec2_atributos.instance_type_webserver
  key_name = var.ec2_atributos.keyname
  vpc_security_group_ids = var.security_group_webserver

  subnet_id = var.subnet_id
  iam_instance_profile = var.ec2_atributos.role

  tags = {
    Name = "Infopublic-Webserver"
  }

}

resource "aws_instance" "dbserver" {
  ami = var.ec2_atributos.ami_dbserver
  instance_type = var.ec2_atributos.instance_type_dbserver
  key_name = var.ec2_atributos.keyname
  vpc_security_group_ids = var.security_group_dbserver

  subnet_id = var.subnet_id
  iam_instance_profile = var.ec2_atributos.role

  tags = {
    Name = "Infopublic-DBServer"
  }
}