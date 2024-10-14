variable "master_node_instance_type" {
  default = "t3.medium"
}

variable "ubuntu_24_04_lts_ami" {
  default = "ami-0e872aee57663ae2d"
}

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

variable "master_node_ebs_size" {
  type        = number
  description = "Master node EBS storage ref"
}

variable "worker_node_instance_type" {
  default = "t3.micro"
}

variable "worker_node_count" {
  type    = number
  default = 2
}

variable "worker_node_ebs_size" {
  type        = number
  description = "Worker node EBS storage ref"
}
