resource "aws_security_group" "ssh_access" {
  name        = "allow_ssh"
  description = "Security group to allow SSH access"

  vpc_id = var.main_vpc_id

  ingress {
    description = "SSH access from anywhere"
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
    Name = "SSH access"
  }

}

resource "aws_security_group" "allow_ping" {
  name        = "spot_k8s_allow_ping_security_group"
  description = "Allows ping between nodes for debug purpose"
  vpc_id      = var.main_vpc_id

  ingress {
    from_port       = -1
    to_port         = -1
    protocol        = "icmp"
    security_groups = ["${aws_security_group.spot_k8s_master.id}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["${aws_security_group.spot_k8s_master.id}"]
  }
}

resource "aws_security_group" "spot_k8s_worker" {
  name        = "spot_k8s_worker_security_group"
  description = "Security group for Worker node"
  vpc_id      = var.main_vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.spot_k8s_master.id}"]
  }

  ingress {
    description     = "Kubelet API"
    from_port       = 10250
    to_port         = 10250
    protocol        = "tcp"
    security_groups = [aws_security_group.spot_k8s_master.id]
  }

  ingress {
    description     = "kube-proxy"
    from_port       = 10256
    to_port         = 10256
    protocol        = "tcp"
    security_groups = [aws_security_group.spot_k8s_master.id]
  }
  ingress {
    description = "Service NodePorts ports"
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["${aws_security_group.spot_k8s_master.id}"]
  }

  tags = {
    Name = "spot k8s - Kubernetes Worker node ports"
  }
}

resource "aws_security_group" "spot_k8s_master" {
  name        = "spot_k8s_master_security_group"
  description = "Security group for Controlplane node"
  vpc_id      = var.main_vpc_id

  ingress {
    description = "Kubernetes API Server"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "etcd server client API"
    from_port   = 2379
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = [var.main_vpc_cidr]
  }

  ingress {
    description = "Kubelet API"
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = [var.main_vpc_cidr]
  }

  ingress {
    description = "kube-scheduler"
    from_port   = 10259
    to_port     = 10259
    protocol    = "tcp"
    cidr_blocks = [var.main_vpc_cidr]
  }

  ingress {
    description = "kube-controller-manager"
    from_port   = 10257
    to_port     = 10257
    protocol    = "tcp"
    cidr_blocks = [var.main_vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "spot k8s - Kubernetes Master node ports"
  }
}
