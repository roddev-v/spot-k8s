variable "bastion_tags" {
  type = object({
    name                           = string
    description                    = string
    sg_name                        = string
    allow_ssh_from_bastion_sg_name = string
  })
  default = {
    name                           = "spot_k8s - Bastion server"
    description                    = "spot_k8s - Bastion server used to access private nodes for debugging purposes"
    sg_name                        = "spot_k8s - Bastion SG"
    allow_ssh_from_bastion_sg_name = "spot_k8s - Allow SSH from Bastion"
  }
}
