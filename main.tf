module "networking" {
  source = "./modules/networking"
}

module "nodes" {
  source = "./modules/nodes"
  main_vpc_id = module.networking.main_vpc_id
  public_subnet_id = module.networking.public_subnet_id
}