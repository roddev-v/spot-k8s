resource "aws_instance" "worker_node" {
  instance_type = var.worker_node_instance_type
  ami           = var.ubuntu_24_04_lts_ami
  subnet_id     = var.private_subnet_id
  count         = var.worker_node_count
  security_groups = [aws_security_group.spot_k8s_worker.id]

  root_block_device {
    volume_size = var.worker_node_ebs_size
  }

  tags = {
    Name = "spot k8s - Worker node ${count.index}"
  }
}
