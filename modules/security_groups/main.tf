resource "aws_security_group" "sg-webapp-publicnet" {
  vpc_id = var.vpc_id

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SG-webserver"
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
  tags = {
    Name = "SG-dbserver"
  }
}

resource "aws_vpc_security_group_ingress_rule" "icmp_ping" {
  description = "retorna solicitacoes ping - precisa habilitar no servidor"
  security_group_id = aws_security_group.sg-webapp-publicnet.id
  ip_protocol = "icmp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = -1
  to_port = -1
}

resource "aws_vpc_security_group_ingress_rule" "web_firebird" {
  description = "permite conexoes ao firebird - precisa habilitar no servidor"
  security_group_id = aws_security_group.sg-webapp-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 3050
  to_port = 3050
}

resource "aws_vpc_security_group_ingress_rule" "web_rdp" {
  description = "permite o acesso remoto atraves do RDP"
  security_group_id = aws_security_group.sg-webapp-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 3389
  to_port = 3389
}

resource "aws_vpc_security_group_ingress_rule" "web_http" {
  security_group_id = aws_security_group.sg-webapp-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port = 80
}

resource "aws_vpc_security_group_ingress_rule" "web_https" {
  security_group_id = aws_security_group.sg-webapp-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 443
  to_port = 443
}

resource "aws_vpc_security_group_ingress_rule" "web_zabbix_agent" {
  description = "Permite monitoramento do zabbix server"
  security_group_id = aws_security_group.sg-webapp-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 10050
  to_port = 10050
}

resource "aws_vpc_security_group_ingress_rule" "rdp_dbserver" {
  description = "Acesso remoto via RDP vindo apenas do servidor WEB."
  security_group_id = aws_security_group.sg-dbserver-publicnet.id
  ip_protocol = "tcp"
  from_port = 3389
  to_port = 3389
  referenced_security_group_id = aws_security_group.sg-webapp-publicnet.id
}

resource "aws_vpc_security_group_ingress_rule" "db_zabbix_agent" {
  description = "Permite monitoramento do zabbix server"
  security_group_id = aws_security_group.sg-dbserver-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 10050
  to_port = 10050
}

resource "aws_vpc_security_group_ingress_rule" "icmp_dbserver" {
  description = "Permite resposta a solicitacoes ping - precisa habilitar a regra no servidor"
  security_group_id = aws_security_group.sg-dbserver-publicnet.id
  ip_protocol = "icmp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = -1
  to_port = -1
}

resource "aws_vpc_security_group_ingress_rule" "db_custom_sqlserver" {
  description = "acesso ao bd mssql atraves de porta customizada"
  security_group_id = aws_security_group.sg-dbserver-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 1598
  to_port = 1598
}

resource "aws_vpc_security_group_ingress_rule" "db_sql_server" {
  description = "acesso ao bd mssql atraves da porta padrao"
  security_group_id = aws_security_group.sg-dbserver-publicnet.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 1433
  to_port = 1433
}
