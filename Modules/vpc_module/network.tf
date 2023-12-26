resource "aws_vpc" "appserver-vpc" {
  cidr_block = var.vpc_info.vpc_cidr

  tags = {
    Name = var.vpc_info.vpc_name
  }
}

resource "aws_subnet" "subnets" {
  count             = length(var.vpc_info.subnet_names)
  vpc_id            = aws_vpc.appserver-vpc.id
  cidr_block        = cidrsubnet(var.vpc_info.vpc_cidr, 8, count.index)
  availability_zone = "${var.region}${var.vpc_info.subnets_azs[count.index]}"

  tags = {
    Name = var.vpc_info.subnet_names[count.index]
  }

  depends_on = [
    aws_vpc.appserver-vpc
  ]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.appserver-vpc.id

  tags = {
    Name = var.vpc_info.igw_name
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.appserver-vpc.id

  tags = {
    Name = "private"
  }

  depends_on = [
    aws_vpc.appserver-vpc,
    aws_internet_gateway.igw
  ]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.appserver-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public"
  }

  depends_on = [
    aws_vpc.appserver-vpc,
    aws_internet_gateway.igw
  ]
}

resource "aws_route_table_association" "private" {
  count          = length(var.vpc_info.private_subnets)
  subnet_id      = data.aws_subnets.private.ids[count.index]
  route_table_id = aws_route_table.private.id

  depends_on = [
    aws_subnet.subnets,
    aws_route_table.private
  ]
}

resource "aws_route_table_association" "public" {
  count          = length(var.vpc_info.public_subnets)
  subnet_id      = data.aws_subnets.public.ids[count.index]
  route_table_id = aws_route_table.public.id

  depends_on = [
    aws_subnet.subnets,
    aws_route_table.public
  ]
}