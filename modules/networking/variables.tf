variable "spot_k8s_cidrs" {
  type = object({
    main_vpc        = string
    public_subnet_0 = string
    public_subnet_1 = string
    private_subnet  = string
  })
  default = {
    main_vpc        = "10.0.0.0/16"
    public_subnet_0 = "10.0.1.0/24"
    public_subnet_1 = "10.0.3.0/24"
    private_subnet  = "10.0.2.0/24"
  }
}

variable "az_0" {
  type = string
}

variable "az_1" {
  type = string
}
