module "networking" {
  source = "./modules/networking"
}

module "nodes" {
  source = "./modules/nodes"

  # networking
  main_vpc_id       = module.networking.main_vpc_id
  main_vpc_cidr     = module.networking.main_vpc_cidr
  public_subnet_id  = module.networking.public_subnet_id
  private_subnet_id = module.networking.private_subner_id

  # storage
  master_node_ebs_size           = var.master_node_ebs_size
  on_demand_worker_node_ebs_size = var.master_node_ebs_size

  # node configuration
  master_node_instance_type           = var.master_node_instance_type
  on_demand_worker_node_instance_type = var.on_demand_worker_node_instance_type
  on_demand_worker_nodes_count        = var.on_demand_worker_nodes_count
}
