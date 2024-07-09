variable "spot_k8s_cidrs" {
  type = object({
    main_vpc       = string
    public_subnet  = string
    private_subnet = string
  })
  default = {
    main_vpc = "10.0.0.0/16"
    public_subnet = "10.0.1.0/24"
    private_subnet = "10.0.2.0/24"
  }
}
