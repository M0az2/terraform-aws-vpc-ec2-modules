
variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

#-------------------------
# VPC

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
  type = bool
}

#-------------------------
# Public Subnet 1


variable "public_subnet_1_name" {
  type = string
}

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_1_az" {
  type = string
}

variable "public_subnet_1_public_ip" {
  type = bool
}

#-------------------------
# Public Subnet 2


variable "public_subnet_2_name" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "public_subnet_2_az" {
  type = string
}

variable "public_subnet_2_public_ip" {
  type = bool
}

#-------------------------
# Private Subnet 1


variable "private_subnet_1_name" {
  type = string
}

variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_1_az" {
  type = string
}

#-------------------------
# Private Subnet 2


variable "private_subnet_2_name" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}

variable "private_subnet_2_az" {
  type = string
}

#-------------------------
# Internet

variable "internet_gateway_name" {
  type = string
}

variable "elastic_ip_name" {
  type = string
}

variable "nat_gateway_name" {
  type = string
}

variable "internet_cidr" {
  type = string
}

#-------------------------
# Route Tables

variable "public_route_table_name" {
  type = string
}

variable "private_route_table_name" {
  type = string
}

#-------------------------
# Security Group

variable "security_group_name" {
  type = string
}

variable "ssh_port" {
  type = number
}

variable "http_port" {
  type = number
}

variable "tcp_protocol" {
  type = string
}

variable "all_protocol" {
  type = string
}

variable "allow_all_cidr" {
  type = string
}