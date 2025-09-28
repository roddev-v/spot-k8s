module "networking" {
  source = "./modules/networking"
  az_0   = var.az_0
  az_1   = var.az_1
}

module "bastion" {
  source = "./modules/bastion"

  subnet_id   = module.networking.public_subnet_0_id
  main_vpc_id = module.networking.main_vpc_id
}

module "compute" {
  source = "./modules/compute"

  main_vpc_id       = module.networking.main_vpc_id
  private_subnet_id = module.networking.private_subner_id
  main_vpc_cidr     = module.networking.main_vpc_cidr
}

module "public-alb" {
  source = "./modules/public"

  main_vpc_id        = module.networking.main_vpc_id
  public_subnet_0_id = module.networking.public_subnet_0_id
  public_subnet_1_id = module.networking.public_subnet_1_id

  permanent_node_ip = module.compute.permanent_node_ip
}


