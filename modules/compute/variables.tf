variable "main_vpc_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "permanent_node_ami" {
  type    = string
  default = "ami-0444794b421ec32e4"
}

variable "permanent_node_instance_type" {
  type    = string
  default = "t3.nano"
}
