# ALB Security Group (public)
resource "aws_security_group" "spot_k8s_public_alb_sg" {
  vpc_id = var.main_vpc_id

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # open to the world
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.public_tags.nlb_security_group
  }
}
