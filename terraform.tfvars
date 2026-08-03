region = "us-east-1"

project_name = "terraform-multi-vpc"

environment = "dev"


ami_id = "YOUR_AMI_ID"

instance_type = "t2.micro"

key_name = "YOUR_KEY"



vpc1_cidr = "10.0.0.0/16"

vpc1_public_subnet_1 = "10.0.1.0/24"

vpc1_public_subnet_2 = "10.0.2.0/24"

vpc1_private_subnet_1 = "10.0.3.0/24"

vpc1_private_subnet_2 = "10.0.4.0/24"



vpc2_cidr = "192.168.0.0/16"

vpc2_public_subnet_1 = "192.168.1.0/24"

vpc2_public_subnet_2 = "192.168.2.0/24"

vpc2_private_subnet_1 = "192.168.3.0/24"

vpc2_private_subnet_2 = "192.168.4.0/24"



az1 = "us-east-1a"

az2 = "us-east-1b"



internet_cidr = "0.0.0.0/0"


ssh_port = 22

http_port = 80

tcp_protocol = "tcp"

all_protocol = "-1"

allow_all_cidr = "0.0.0.0/0"