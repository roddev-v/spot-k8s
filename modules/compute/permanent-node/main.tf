resource "aws_instance" "permanent_node" {
  ami                    = var.permanent_node_ami
  instance_type          = var.permanent_node_instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.private_node_sg.id]

  tags = {
    Name = var.permament_node_tags.name
  }
}
