resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  enable_dns_support = var.enable_dns_support

  enable_dns_hostnames = var.enable_dns_hostnames


  tags = {
    Name = "${var.vpc_name}-vpc"
  }

}



resource "aws_subnet" "public_subnet_1" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_1_cidr

  availability_zone = var.public_subnet_1_az

  map_public_ip_on_launch = var.public_subnet_1_public_ip


  tags = {
    Name = "${var.vpc_name}-public-subnet-1"
  }

}



resource "aws_subnet" "public_subnet_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_2_cidr

  availability_zone = var.public_subnet_2_az

  map_public_ip_on_launch = var.public_subnet_2_public_ip


  tags = {
    Name = "${var.vpc_name}-public-subnet-2"
  }

}



resource "aws_subnet" "private_subnet_1" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_1_cidr

  availability_zone = var.private_subnet_1_az


  tags = {
    Name = "${var.vpc_name}-private-subnet-1"
  }

}



resource "aws_subnet" "private_subnet_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_2_cidr

  availability_zone = var.private_subnet_2_az


  tags = {
    Name = "${var.vpc_name}-private-subnet-2"
  }

}



resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.main.id


  tags = {
    Name = "${var.vpc_name}-igw"
  }

}



resource "aws_eip" "nat_eip" {

  domain = "vpc"


  tags = {
    Name = "${var.vpc_name}-nat-eip"
  }

}



resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public_subnet_1.id


  tags = {
    Name = "${var.vpc_name}-nat-gateway"
  }

}



resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.main.id


  route {

    cidr_block = var.internet_cidr

    gateway_id = aws_internet_gateway.igw.id

  }


  tags = {
    Name = "${var.vpc_name}-public-route-table"
  }

}



resource "aws_route_table" "private_rt" {

  vpc_id = aws_vpc.main.id


  route {

    cidr_block = var.internet_cidr

    nat_gateway_id = aws_nat_gateway.nat.id

  }


  tags = {
    Name = "${var.vpc_name}-private-route-table"
  }

}



resource "aws_route_table_association" "public_assoc_1" {

  subnet_id = aws_subnet.public_subnet_1.id

  route_table_id = aws_route_table.public_rt.id

}



resource "aws_route_table_association" "public_assoc_2" {

  subnet_id = aws_subnet.public_subnet_2.id

  route_table_id = aws_route_table.public_rt.id

}



resource "aws_route_table_association" "private_assoc_1" {

  subnet_id = aws_subnet.private_subnet_1.id

  route_table_id = aws_route_table.private_rt.id

}



resource "aws_route_table_association" "private_assoc_2" {

  subnet_id = aws_subnet.private_subnet_2.id

  route_table_id = aws_route_table.private_rt.id

}



resource "aws_security_group" "web_sg" {

  name = "${var.vpc_name}-security-group"

  vpc_id = aws_vpc.main.id


  ingress {

    from_port = var.ssh_port

    to_port = var.ssh_port

    protocol = var.tcp_protocol

    cidr_blocks = [var.allow_all_cidr]

  }


  ingress {

    from_port = var.http_port

    to_port = var.http_port

    protocol = var.tcp_protocol

    cidr_blocks = [var.allow_all_cidr]

  }


  egress {

    from_port = 0

    to_port = 0

    protocol = var.all_protocol

    cidr_blocks = [var.allow_all_cidr]

  }


  tags = {
    Name = "${var.vpc_name}-sg"
  }

}