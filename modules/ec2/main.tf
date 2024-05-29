resource "aws_eip_association" "webserver" {
  instance_id = aws_instance.webserver.id
  allocation_id = var.ec2_atributos.webserver_allocation_id
}

resource "aws_eip_association" "dbserver" {
  instance_id = aws_instance.dbserver.id
  allocation_id = var.ec2_atributos.dbserver_allocation_id
}

resource "aws_placement_group" "aplicativo_web" {
  name = "app-web-server"
  strategy = "cluster"
}

resource "aws_instance" "webserver" {
  ami = var.ec2_atributos.ami_webserver
  instance_type = var.ec2_atributos.instance_type_webserver
  key_name = var.ec2_atributos.keyname
  vpc_security_group_ids = var.security_group_webserver

  subnet_id = var.subnet_id
  iam_instance_profile = var.ec2_atributos.role
  placement_group = aws_placement_group.aplicativo_web.id

  tags = {
    Name = "Infopublic-Webserver"
  }

}

resource "aws_instance" "dbserver" {
  ami = var.ec2_atributos.ami_dbserver
  instance_type = var.ec2_atributos.instance_type_dbserver
  key_name = var.ec2_atributos.keyname
  vpc_security_group_ids = var.security_group_dbserver
  placement_group = aws_placement_group.aplicativo_web.id

  subnet_id = var.subnet_id
  iam_instance_profile = var.ec2_atributos.role

  tags = {
    Name = "Infopublic-DBServer"
  }
}