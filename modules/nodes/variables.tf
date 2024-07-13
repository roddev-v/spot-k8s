variable "master_node_instance_type" {
  default = "t3.medium"
}

variable "main_vpc_id" {
  type = string
  description = "Main spot k8s VPC id"
}

variable "main_vpc_cidr" {
  type = string
  description = "Main VPC CIDR block"
}

variable "public_subnet_id" {
  type = string
  description = "Public subnet id"
}