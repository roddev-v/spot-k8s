variable "permament_node_tags" {
  type = object({
    name = string
  })
  default = {
    name = "spot_k8s Permanent node"
  }
}
