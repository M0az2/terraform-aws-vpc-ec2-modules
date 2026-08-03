output "vpc1_id" {

  description = "VPC 1 ID"

  value = module.vpc1.vpc_id

}


output "vpc2_id" {

  description = "VPC 2 ID"

  value = module.vpc2.vpc_id

}


output "vpc1_public_subnets" {

  description = "VPC1 Public Subnet IDs"

  value = [
    module.vpc1.public_subnet_1_id,
    module.vpc1.public_subnet_2_id
  ]

}


output "vpc2_public_subnets" {

  description = "VPC2 Public Subnet IDs"

  value = [
    module.vpc2.public_subnet_1_id,
    module.vpc2.public_subnet_2_id
  ]

}


output "ec2_vpc1_id" {

  description = "EC2 Instance in VPC1"

  value = module.ec2_vpc1.instance_id

}


output "ec2_vpc2_id" {

  description = "EC2 Instance in VPC2"

  value = module.ec2_vpc2.instance_id

}


output "ec2_vpc1_public_ip" {

  description = "EC2 VPC1 Public IP"

  value = module.ec2_vpc1.public_ip

}


output "ec2_vpc2_public_ip" {

  description = "EC2 VPC2 Public IP"

  value = module.ec2_vpc2.public_ip

}