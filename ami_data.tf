data "aws_ami" "windows_servers" {
  provider    = aws
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }

  owners = ["801119661308"] //microsoft
}