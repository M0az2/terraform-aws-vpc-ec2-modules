variable "region" {
  type = string
}


variable "project_name" {
  type = string
}


variable "environment" {
  type = string
}


variable "ami_id" {
  type = string
}


variable "instance_type" {
  type = string
}


variable "key_name" {
  type = string
}



# -----------------------
# VPC 1

variable "vpc1_cidr" {
  type = string
}

variable "vpc1_public_subnet_1" {
  type = string
}

variable "vpc1_public_subnet_2" {
  type = string
}

variable "vpc1_private_subnet_1" {
  type = string
}

variable "vpc1_private_subnet_2" {
  type = string
}


# ---------------------------
# VPC 2

variable "vpc2_cidr" {
  type = string
}

variable "vpc2_public_subnet_1" {
  type = string
}

variable "vpc2_public_subnet_2" {
  type = string
}

variable "vpc2_private_subnet_1" {
  type = string
}

variable "vpc2_private_subnet_2" {
  type = string
}


# ----------------------------
# Availability Zones

variable "az1" {
  type = string
}

variable "az2" {
  type = string
}


# -------------------------
# Networking

variable "internet_cidr" {
  type = string
}


# ------------------------
# Security Group

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