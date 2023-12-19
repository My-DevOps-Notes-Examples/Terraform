resource "aws_vpc" "multiuser" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = format("ntier-%s", terraform.workspace)
  }
}