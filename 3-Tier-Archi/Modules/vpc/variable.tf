variable "vpc_cidr" {
  description = "cidr for vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "sub_vpc_id" {
  description = "vpc id for public subnet 1"
  type        = string
  default     = "aws_vpc.threetiervpc.id"
}

variable "az_1" {
  description = "AZ for public subnet 1"
  type        = string
  default     = "us-east-1a"
}

variable "az_2" {
  description = "AZ for public subnet 2"
  type        = string
  default     = "us-east-1b"
}

variable "pub_sub_cidr_1" {
  description = "cidr for public subnet 1"
  type        = string
  default     = "10.0.0.0/24"
}

variable "pri_sub_cidr_1" {
  description = "cidr for private subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "pub_sub_cidr_2" {
  description = "cidr for public subnet 2"
  type        = string
  default     = "10.0.3.0/24"
}

variable "pri_sub_cidr_2" {
  description = "cidr for private database subnet 1"
  type        = string
  default     = "10.0.2.0/24"
}

variable "pri_sub_cidr_3" {
  description = "cidr for private subnet 2"
  type        = string
  default     = "10.0.4.0/24"
}

variable "pri_sub_cidr_4" {
  description = "cidr for private database subnet 2"
  type        = string
  default     = "10.0.5.0/24"
}

variable "Elastic_IP" {
  description = "elastic ip for vpc"
  type        = bool
  default     = true
}

variable "nat_allocation_id_1" {
  description = "allocation id for NAT gateway 1"
  type        = string
  default     = "aws_eip.eip.id"
}


variable "nat_sub_id_1" {
  description = "subnet id for NAT gateway 1"
  type        = string
  default     = "aws_subnet.public_sub_1.id"
}

variable "nat_allocation_id_2" {
  description = "allocation id for NAT gateway 1"
  type        = string
  default     = "aws_eip.eip_1.id"
}

variable "nat_sub_id_2" {
  description = "subnet id for NAT gateway 2"
  type        = string
  default     = "aws_subnet.public_sub_2.id"
}


variable "route_table_IG_id" {
  description = "IGW id for Route Table"
  type        = string
  default     = "aws_internet_gateway.igw_threetier.id"
}

variable "route_table_cidr"{
    description = "Route Table CIDR Range"
    type        = any
    default     = "0.0.0.0/0"
}

variable "route_nat_id_1" {
  description = "Route Table NAT gateway-1 id "
  type        = string
  default     = "aws_nat_gateway.nat_gat_1.id"
}


variable "route_nat_id_2" {
  description = "Route Table NAT gateway-2 id"
  type        = string
  default     = "aws_nat_gateway.nat_gat_2.id"
}

variable "rt_assoc_pubsub_1"{
    type       = string
    default    = "aws_subnet.public_sub_1.id"
}

variable "rt_assoc_pubsub_2"{
    type       = string
    default    = "aws_subnet.public_sub_2.id"
}

variable "rt_assoc_rtid_pub"{
    type       = string
    default    = "aws_route_table.public_rt.id"
}

variable "rt_assoc_prisub_1"{
    type       = string
    default    = "aws_subnet.private_sub_1.id"
}

variable "rt_assoc_rtid_priv"{
    type       = string
    default    = "aws_route_table.private_nat_rt.id"
}

variable "rt_assoc_prisub_2"{
    type       = string
    default    = "aws_subnet.private_sub_2.id"
}

variable "rt_assoc_rtid_priv_1"{
    type       = string
    default    = "aws_route_table.private_nat_rt_1.id"
}

variable "extern_sg_name" {
  type        = string
  default     = "External_LB"
}


variable "extern_sg_des" {
  type        = string
  default     = "Allow External_LB Traffic"
}


variable "ing_from_to_port" {
  type        = number
  default     = 80
}


variable "egr_from_to_port" {
  type        = number
  default     = 0
}


variable "ingress_sg_protocol" {
  description = "protocol for security group"
  type        = string
  default     = "tcp"
}


variable "egress_sg_protocol" {
  type        = string
  default     = "1"
}


variable "extern_cidr_sg" {
  description = "cidr block for external"
  type        = string
  default     = "0.0.0.0/0"
}

variable "self_ip"{
    type       = bool
    default    = true
}

variable "ipv6_cidr" {
  description = "cidr block engress for ipv6"
  type        = string
  default     = "::/0"
}

variable "intern_sg_name" {
  type        = string
  default     = "Internal_LB"
}

variable "internal_description" {
  type        = string
  default     = "Allow Internal_LB Traffic"
}

variable "internal_description_ingress" {
  type        = string
  default     = "Internall_LB Traffic Inbound"
}

variable "internal_cidr_blk" {
  description = "cidr block engress for internal"
  type        = string 
  default     = "aws_vpc.threetiervpc.cidr_block"
}

variable "intern_ingress_sg" {
  type        = string
  default     = "[aws_security_group.Public_EC2.id]"
}


variable "public_sg_name" {
  type        = string
  default     = "Public_EC2"
}


variable "public_sg_desc" {
  type        = string
  default     = "Allow Public_EC2 Traffic"
}

variable "public_sg_desc_ingr" {
  type        = string
  default     = "Public_EC2 Traffic Inbound"
}

variable "pub_ingr_sg" {
  type        = string
  default     = "[aws_security_group.External_LB.id]"
}


variable "private_sg_name" {
  type        = string
  default     = "Private_EC2"
}

variable "priv_description" {
  type        = string
  default     = "Allow Private_EC2 Traffic"
}

variable "priv_description_ingr" {
  type        = string
  default     = "Private_EC2 Traffic Inbound"
}

variable "priv_ingr_sg" {
  type        = string
  default     = "[aws_security_group.Internal_LB.id]"
}


variable "dbms_sg_name" {
  description = "database sg"
  type        = string
  default     = "DBMS"
}


variable "dbms_des" {
  type        = string
  default     = "Allow DBMS Traffic"
}

variable "dbms_des_ingr" {
  type        = string
  default     = "DBMS Traffic Inbound"
}

variable "dbms_port" {
  type        = number
  default     = 3306
}


variable "dbms_ingr_sg" {
  type        = string
  default     = "[aws_security_group.Private_EC2.id]"
}

variable "bast_sg_name" {
  type        = string
  default     = "bastion_host"
}


variable "bast_des" {
  type        = string
  default     = "Allow SSH Traffic"
}

variable "bast_des_ingr" {
  type        = string
  default     = "Bastion_host Traffic Inbound"
}

variable "bash_ssh_port" {
  type        = number
  default     = 22
}