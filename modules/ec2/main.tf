resource "aws_instance" "webserver" {
  ami = var.ec2_ami_webserver
  instance_type = var.instance_type_webserver
  key_name = var.key_name
  vpc_security_group_ids = var.security_group_webserver

  subnet_id = var.subnet_id

  tags = var.tags

}

resource "aws_instance" "dbserver" {
  ami = var.ec2_ami_dbserver
  instance_type = var.instance_type_dbserver
  key_name = var.key_name
  vpc_security_group_ids = var.security_group_dbserver

  subnet_id = var.subnet_id

  tags = var.tags
}