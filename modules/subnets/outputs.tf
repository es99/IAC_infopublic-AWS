output "public_subnet-AZ" {
  value = aws_subnet.public_subnet.availability_zone
}

output "public_subnet-CIDR" {
    value = aws_subnet.public_subnet.cidr_block
}

output "private_subnet-AZ" {
  value = aws_subnet.private_subnet.availability_zone
}

output "private_subnet-CIDR" {
    value = aws_subnet.private_subnet.cidr_block
}

output "public_subnet-ID" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet-ID" {
  value = aws_subnet.private_subnet.id
}