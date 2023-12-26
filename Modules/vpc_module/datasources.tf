data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = var.vpc_info.private_subnets
  }

  depends_on = [
    aws_subnet.subnets
  ]
}

data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = var.vpc_info.public_subnets
  }

  depends_on = [
    aws_subnet.subnets
  ]
}