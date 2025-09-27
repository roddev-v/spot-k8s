variable "public_tags" {
  type = object({
    alb_security_group = string
    alb = string
    target_group = string
  })
  default = {
    alb = "spot_k8s - ALB"
    alb_security_group = "spot_k8s - ALB Security Group"
    target_group = "spot_k8s - Target Group"
  }
}
