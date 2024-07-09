variable "master_node_instance_type" {
  default = "t3.micro"
}

variable "master_node_ami" {
  default = "ami-0910ce22fbfa68e1d"
}

variable "main_vpc_id" {
  type = string
  description = "Main spot k8s VPC id"
}

variable "public_subnet_id" {
  type = string
  description = "Public subnet id"
}