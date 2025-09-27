variable "public_tags" {
  type = object({
    alb_security_group = string
    alb = string
  })
  default = {
    alb = "spot_k8s - ALB"
    alb_security_group = "spot_k8s - ALB Security Group"
  }
}
