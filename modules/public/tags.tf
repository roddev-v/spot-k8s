variable "public_tags" {
  type = object({
    nlb                = string
    nlb_target_group = string
    nlb_security_group       = string
  })
  default = {
    nlb                = "spot_k8s - NLB"
    nlb_target_group   = "spot_k8s - NLB Target Group"
    nlb_security_group = "spot_k8s - NLB Security Group"
  }
}
