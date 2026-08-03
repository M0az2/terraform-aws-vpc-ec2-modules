# VPC ID

output "vpc_id" {

  description = "VPC ID"

  value = aws_vpc.main.id

}



# -------------------------
# Public Subnets

output "public_subnet_1_id" {

  description = "Public Subnet 1 ID"

  value = aws_subnet.public_subnet_1.id

}



output "public_subnet_2_id" {

  description = "Public Subnet 2 ID"

  value = aws_subnet.public_subnet_2.id

}



# --------------------------------
# Private Subnets

output "private_subnet_1_id" {

  description = "Private Subnet 1 ID"

  value = aws_subnet.private_subnet_1.id

}



output "private_subnet_2_id" {

  description = "Private Subnet 2 ID"

  value = aws_subnet.private_subnet_2.id

}



# ---------------------------------
# Security Group

output "security_group_id" {

  description = "Security Group ID"

  value = aws_security_group.web_sg.id

}



# -------------------
# Internet Gateway

output "internet_gateway_id" {

  description = "Internet Gateway ID"

  value = aws_internet_gateway.igw.id

}



# ----------------------------
# NAT Gateway

output "nat_gateway_id" {

  description = "NAT Gateway ID"

  value = aws_nat_gateway.nat.id

}