variable "main_vpc_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "main_vpc_cidr" {
  type = string
}

variable "permanent_node_instance_type" {
  type = string
}

variable "permanent_node_ami" {
  type = string
}

variable "allow_ssh_from_bastion_sg_id" {
  type = string
}
