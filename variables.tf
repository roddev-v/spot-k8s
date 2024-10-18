variable "master_node_ebs_size" {
  default = 20
  type    = number
}

variable "worker_node_ebs_size" {
  default = 20
  type    = number
}

variable "master_node_instance_type" {
  default = "t3.medium"
  type    = string
}

variable "on_demand_worker_node_instance_type" {
  default = "t3.micro"
  type    = string
}

variable "on_demand_worker_nodes_count" {
  default = 2
  type    = number
}