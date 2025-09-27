variable "networking_tags" {
  description = "Tags used for each part of the spot_k8s architecture"
  type = object({
    vpc                  = string
    public_subnet_0      = string
    public_subnet_1      = string
    private_subnet       = string
    internet_gateway     = string
    public_routing_table = string
  })

  default = {
    vpc                  = "spot-k8s",
    public_subnet_0      = "spot-k8s - Public subnet 0",
    public_subnet_1      = "spot-k8s - Public subnet 1",
    private_subnet       = "spot-k8s - Private subnet 0",
    internet_gateway     = "spot-k8s - Internet gateway",
    public_routing_table = "spot-k8s - Routing table to public internet",
  }
}
