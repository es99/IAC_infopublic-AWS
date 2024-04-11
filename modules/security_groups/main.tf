resource "aws_security_group" "sg-webapp-publicnet" {
  vpc_id = var.vpc_id

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "sg-dbserver-publicnet" {
    vpc_id = var.vpc_id

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_vpc_security_group_ingress_rule" "icmp_ping" {
  security_group_id = aws_security_group.sg-webapp-publicnet.id
  ip_protocol = "icmp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = -1
  to_port = -1
}

resource "aws_vpc_security_group_ingress_rule" "firebird" {
  security_group_id = aws_security_group.sg-webapp-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 3050
  to_port = 3050
}

resource "aws_vpc_security_group_ingress_rule" "rdp" {
  security_group_id = aws_security_group.sg-webapp-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 3389
  to_port = 3389
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.sg-webapp-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port = 80
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.sg-webapp-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 443
  to_port = 443
}

resource "aws_vpc_security_group_ingress_rule" "zabbix_agent" {
  security_group_id = aws_security_group.sg-webapp-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 10050
  to_port = 10050
}

resource "aws_vpc_security_group_ingress_rule" "rdp_dbserver" {
  security_group_id = aws_security_group.sg-dbserver-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = aws_security_group.sg-webapp-publicnet.id
  from_port = 3389
  to_port = 3389
}

resource "aws_vpc_security_group_ingress_rule" "zabbix_agent" {
  security_group_id = aws_security_group.sg-dbserver-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 10050
  to_port = 10050
}

resource "aws_vpc_security_group_ingress_rule" "icmp_dbserver" {
  security_group_id = aws_security_group.sg-dbserver-publicnet.id
  ip_protocol = "icmp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = -1
  to_port = -1
}

resource "aws_vpc_security_group_ingress_rule" "custom_sqlserver" {
  security_group_id = aws_security_group.sg-dbserver-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 1598
  to_port = 1598
}

resource "aws_vpc_security_group_ingress_rule" "sql_server" {
  security_group_id = aws_security_group.sg-dbserver-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 1433
  to_port = 1433
}
