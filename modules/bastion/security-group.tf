resource "aws_security_group" "bastion_security_gorup" {
  vpc_id = var.main_vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.bastion_tags.sg_name
  }
}

resource "aws_security_group" "allow_ssh_from_bastion" {
  name_prefix = "allow-ssh-from-bastion-"
  vpc_id      = var.main_vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_security_gorup.id]
  }

  tags = {
    Name = var.bastion_tags.allow_ssh_from_bastion_sg_name
  }
}
