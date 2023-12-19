resource "aws_vpc" "multiuser" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = format("ntier-%s", terraform.workspace)
  }
}

resource "aws_subnet" "dev" {
  count      = terraform.workspace == "dev" ? 1 : 0
  vpc_id     = aws_vpc.multiuser.id
  cidr_block = var.subnet_dev

  tags = {
    Name = format("subnet-%s", terraform.workspace)
  }
}