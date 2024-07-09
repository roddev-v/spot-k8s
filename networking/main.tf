resource "aws_vpc" "main_vpc" {
  cidr_block = var.spot_k8s_cidrs.main_vpc

  tags = {
    Name = "spot-k8s-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.spot_k8s_cidrs.public_subnet

  tags = {
    Name = "spot-k8s-vpc - Public subnet 0"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.spot_k8s_cidrs.private_subnet

  tags = {
    Name = "spot-k8s-vpc - Private subnet 0"
  }
}

resource "aws_internet_gateway" "interget_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "spot-k8s - Internet gateway"
  }
}

resource "aws_route_table" "public_routing_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.interget_gateway.id
  }

  tags = {
    Name = "spot-k8s - Routing table to public internet"
  }
}