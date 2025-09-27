module "networking" {
  source = "./modules/networking"
  az_0   = var.az_0
  az_1   = var.az_1
}

module "public-alb" {
  source = "./modules/public-alb"

  main_vpc_id        = module.networking.main_vpc_id
  public_subnet_0_id = module.networking.public_subnet_0_id
  public_subnet_1_id = module.networking.public_subnet_1_id
}
