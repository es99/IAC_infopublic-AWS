output "sg-webapp-ID" {
  value = aws_security_group.sg-webapp-publicnet.id
}

output "sg-dbserver-ID" {
  value = aws_security_group.sg-dbserver-publicnet.id
}