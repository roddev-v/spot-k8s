resource "aws_instance" "master_node" {
  instance_type               = var.master_node_instance_type
  ami                         = var.master_node_ami
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.ssh_access.id, aws_security_group.public_k8s.id]

  tags = {
    Name = "spot k8s - Master node"
  }
}

