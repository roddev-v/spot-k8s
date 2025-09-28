
variable "subnet_id" {
  type = string
}

variable "main_vpc_id" {
  type = string
}

variable "bastion_ami" {
  type    = string
  default = "ami-0444794b421ec32e4"
}

variable "bastion_instance_type" {
  type    = string
  default = "t3.nano"
}
