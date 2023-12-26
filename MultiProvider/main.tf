resource "aws_vpc" "vpc_1" {
  cidr_block = "198.162.0.0/16"
  provider   = aws.default

  tags = {
    Name = "vpc-1"
  }
}

resource "aws_vpc" "vpc_2" {
  cidr_block = "10.100.0.0/16"
  provider   = aws.second

  tags = {
    Name = "vpc-2"
  }
}