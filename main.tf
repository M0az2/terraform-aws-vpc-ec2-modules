# ==========================
# VPC 1
# ==========================

module "vpc1" {

  source = "./modules/vpc"


  project_name = var.project_name
  environment  = var.environment


  vpc_name = "vpc-1"

  vpc_cidr = var.vpc1_cidr



  enable_dns_support = true

  enable_dns_hostnames = true



  # Public Subnet 1

  public_subnet_1_name = "vpc1-public-subnet-1"

  public_subnet_1_cidr = var.vpc1_public_subnet_1

  public_subnet_1_az = var.az1

  public_subnet_1_public_ip = true



  # Public Subnet 2

  public_subnet_2_name = "vpc1-public-subnet-2"

  public_subnet_2_cidr = var.vpc1_public_subnet_2

  public_subnet_2_az = var.az2

  public_subnet_2_public_ip = true



  # Private Subnet 1

  private_subnet_1_name = "vpc1-private-subnet-1"

  private_subnet_1_cidr = var.vpc1_private_subnet_1

  private_subnet_1_az = var.az1



  # Private Subnet 2

  private_subnet_2_name = "vpc1-private-subnet-2"

  private_subnet_2_cidr = var.vpc1_private_subnet_2

  private_subnet_2_az = var.az2



  # Networking

  internet_gateway_name = "vpc1-igw"

  elastic_ip_name = "vpc1-nat-eip"

  nat_gateway_name = "vpc1-nat"


  internet_cidr = var.internet_cidr


  public_route_table_name = "vpc1-public-rt"

  private_route_table_name = "vpc1-private-rt"



  # Security Group

  security_group_name = "vpc1-security-group"

  ssh_port = var.ssh_port

  http_port = var.http_port

  tcp_protocol = var.tcp_protocol

  all_protocol = var.all_protocol

  allow_all_cidr = var.allow_all_cidr

}





# ==========================
# VPC 2
# ==========================

module "vpc2" {

  source = "./modules/vpc"


  project_name = var.project_name

  environment = var.environment


  vpc_name = "vpc-2"

  vpc_cidr = var.vpc2_cidr



  enable_dns_support = true

  enable_dns_hostnames = true



  # Public Subnet 1

  public_subnet_1_name = "vpc2-public-subnet-1"

  public_subnet_1_cidr = var.vpc2_public_subnet_1

  public_subnet_1_az = var.az1

  public_subnet_1_public_ip = true



  # Public Subnet 2

  public_subnet_2_name = "vpc2-public-subnet-2"

  public_subnet_2_cidr = var.vpc2_public_subnet_2

  public_subnet_2_az = var.az2

  public_subnet_2_public_ip = true



  # Private Subnet 1

  private_subnet_1_name = "vpc2-private-subnet-1"

  private_subnet_1_cidr = var.vpc2_private_subnet_1

  private_subnet_1_az = var.az1



  # Private Subnet 2

  private_subnet_2_name = "vpc2-private-subnet-2"

  private_subnet_2_cidr = var.vpc2_private_subnet_2

  private_subnet_2_az = var.az2



  # Networking

  internet_gateway_name = "vpc2-igw"

  elastic_ip_name = "vpc2-nat-eip"

  nat_gateway_name = "vpc2-nat"


  internet_cidr = var.internet_cidr


  public_route_table_name = "vpc2-public-rt"

  private_route_table_name = "vpc2-private-rt"



  # Security Group

  security_group_name = "vpc2-security-group"

  ssh_port = var.ssh_port

  http_port = var.http_port

  tcp_protocol = var.tcp_protocol

  all_protocol = var.all_protocol

  allow_all_cidr = var.allow_all_cidr

}



# ==========================
# EC2 in VPC 1
# ==========================

module "ec2_vpc1" {

  source = "./modules/ec2"


  ami_id = var.ami_id

  instance_type = var.instance_type

  instance_name = "web-server-vpc1"

  subnet_id = module.vpc1.public_subnet_1_id

  security_group_id = module.vpc1.security_group_id

  key_name = var.key_name

}



# ==========================
# EC2 in VPC 2
# ==========================

module "ec2_vpc2" {

  source = "./modules/ec2"


  ami_id = var.ami_id

  instance_type = var.instance_type

  instance_name = "web-server-vpc2"

  subnet_id = module.vpc2.public_subnet_1_id

  security_group_id = module.vpc2.security_group_id

  key_name = var.key_name

}