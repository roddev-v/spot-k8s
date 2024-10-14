resource "aws_instance" "worker_node" {
  instance_type   = var.worker_node_instance_type
  ami             = var.ubuntu_24_04_lts_ami
  subnet_id       = var.private_subnet_id
  count           = var.worker_node_count
  security_groups = [aws_security_group.spot_k8s_worker.id]

  user_data = <<-EOF
    #!/bin/bash
    NEW_HOSTNAME="spot-k8s-worker-${count.index}"
    hostnamectl set-hostname "$NEW_HOSTNAME"
    sed -i "s/127.0.1.1.*/127.0.1.1 $NEW_HOSTNAME/" /etc/hosts
    echo "Hostname changed to $NEW_HOSTNAME"
  EOF


  root_block_device {
    volume_size = var.worker_node_ebs_size
  }

  tags = {
    Name = "spot k8s - Worker node ${count.index}"
  }
}
