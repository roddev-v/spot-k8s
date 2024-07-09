terraform {
  backend "s3" {
    bucket = "spot-k8s-terraform-state"
    key = "networking.terraform_state"
    region = "eu-central-1"
  }
}