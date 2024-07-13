data "aws_ami" "spot_k8s_ami" {
  filter {
    name   = "name"
    values = ["spot-k8s-base-ami"]
  }
}
