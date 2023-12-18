resource "aws_vpc" "multiuser" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "multiuser"
  }
}