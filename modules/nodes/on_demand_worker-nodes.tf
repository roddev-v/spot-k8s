resource "aws_instance" "worker_node" {
  instance_type   = var.on_demand_worker_node_instance_type
  ami             = var.ubuntu_24_04_lts_ami
  subnet_id       = var.private_subnet_id
  count           = var.on_demand_worker_nodes_count
  security_groups = [aws_security_group.spot_k8s_worker.id, aws_security_group.allow_ping.id, aws_security_group.spot_k8s_worker]

  root_block_device {
    volume_size = var.on_demand_worker_node_ebs_size
  }

  tags = {
    Name = "spot k8s - On-demand worker node ${count.index}"
  }
}
