resource "aws_instance" "master_node" {
  instance_type               = var.master_node_instance_type
  ami                         = var.ubuntu_24_04_lts_ami
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.ssh_access.id, aws_security_group.spot_k8s_master.id]

  user_data = file("${path.module}/scripts/master-user-data.sh")

  root_block_device {
    volume_size = var.master_node_ebs_size
  }

  tags = {
    Name = "spot k8s - Master node"
  }
}
