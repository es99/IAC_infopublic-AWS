output "ec2-webserver-id" {
  value = aws_instance.webserver.id
}

output "ec2-dbserver-id" {
  value = aws_instance.dbserver.id
}

output "ec2-webserver-public-ipaddress" {
  value = aws_instance.webserver.public_ip
}

output "ec2-dbserver-public-ipaddress" {
  value = aws_instance.dbserver.public_ip
}

output "ec2-webserver-private-ipaddress" {
  value = aws_instance.webserver.private_ip
}

output "ec2-dbserver-private-ipaddress" {
  value = aws_instance.dbserver.private_ip
}

output "ec2-webserver-publicdns" {
  value = aws_instance.webserver.public_dns
}

output "ec2-dbserver-publicdns" {
  value = aws_instance.dbserver.public_dns
}

// Apesar do valor estar indicando a keyname do ec2-webserver, esta keyname é utilizada
// em todos os ec2
output "ec2-keyname" {
  value = aws_instance.webserver.key_name
}

output "instance_type_webserver" {
  value = aws_instance.webserver.instance_type
}

output "instance_type_dbserver" {
  value = aws_instance.dbserver.instance_type
}

output "ec2_assumed_role-DBServer" {
  value = aws_instance.dbserver.iam_instance_profile
}

output "ec2_assumed_role-Webserver" {
  value = aws_instance.webserver.iam_instance_profile
}