module "networking" {
  source = "./modules/networking"
}

module "storage" {
  source = "./modules/storage"
}

module "nodes" {
  source = "./modules/nodes"

  # networking
  main_vpc_id      = module.networking.main_vpc_id
  main_vpc_cidr    = module.networking.main_vpc_cidr
  public_subnet_id = module.networking.public_subnet_id
  private_subnet_id = module.networking.private_subner_id

  # storage
  master_node_ebs_size = module.storage.master_node_ebs_size
  worker_node_ebs_size = module.storage.worker_node_ebs_size
}
