module "compute" {
  source = "./permanent-node"

  main_vpc_id       = var.main_vpc_id
  private_subnet_id = var.private_subnet_id

  permanent_node_ami           = var.permanent_node_ami
  permanent_node_instance_type = var.permanent_node_instance_type
}
