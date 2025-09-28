resource "aws_vpc" "main_vpc" {
  cidr_block           = var.spot_k8s_cidrs.main_vpc
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.networking_tags.vpc
  }
}

resource "aws_subnet" "public_subnet_0" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.spot_k8s_cidrs.public_subnet_0
  map_public_ip_on_launch = true
  availability_zone       = var.az_0

  tags = {
    Name = var.networking_tags.public_subnet_0
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.spot_k8s_cidrs.public_subnet_1
  map_public_ip_on_launch = true
  availability_zone       = var.az_1

  tags = {
    Name = var.networking_tags.public_subnet_1
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.spot_k8s_cidrs.private_subnet

  tags = {
    Name = var.networking_tags.private_subnet
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = var.networking_tags.internet_gateway
  }
}

resource "aws_nat_gateway" "nat" {
  subnet_id = aws_subnet.private_subnet.id

  tags = {
    Name = "nat-gateway"
  }
}

resource "aws_route_table" "public_routing_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = var.networking_tags.public_routing_table
  }
}

resource "aws_route_table" "private_routing_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

resource "aws_route_table_association" "public_subnet_0_association" {
  subnet_id      = aws_subnet.public_subnet_0.id
  route_table_id = aws_route_table.public_routing_table.id
}

resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_routing_table.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_routing_table.id
}
