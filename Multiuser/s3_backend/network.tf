resource "aws_vpc" "multiuser" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "ntier-${terraform.workspace}"
  }
}