variable "ubuntu_24_04_lts_ami" {
  default = "ami-0e872aee57663ae2d"
}

# Networking
variable "main_vpc_id" {
  type        = string
  description = "Main spot k8s VPC id"
}

variable "main_vpc_cidr" {
  type        = string
  description = "Main VPC CIDR block"
}

variable "public_subnet_id" {
  type        = string
  description = "Public subnet id"
}

variable "private_subnet_id" {
  type        = string
  description = "Private subnet id"
}

# Master node
variable "master_node_instance_type" {
  type        = string
  description = "Master node instance type"
}

variable "master_node_ebs_size" {
  type        = number
  description = "Master node EBS storage ref"
}

# Worker nodes (permanent worker nodes)
variable "on_demand_worker_node_instance_type" {
  type        = string
  description = "On-demand worker node instance type"
}

variable "on_demand_worker_nodes_count" {
  type        = number
  description = "On-demand worker nodes count"
}

variable "on_demand_worker_node_ebs_size" {
  type        = number
  description = "On-demand worker node EBS storage ref"
}
