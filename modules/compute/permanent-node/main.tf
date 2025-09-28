resource "aws_instance" "permanent_node" {
  ami                    = var.permanent_node_ami
  instance_type          = var.permanent_node_instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.private_node_sg.id, var.allow_ssh_from_bastion_sg_id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y python3
    
    # Ultra-simple HTTP server
    nohup python3 -m http.server 6443 --bind 0.0.0.0 > /home/ec2-user/server.log 2>&1 &
    
    echo "Simple HTTP server started on port 6443" > /home/ec2-user/startup.log
    sleep 2
    netstat -tlnp | grep 6443 >> /home/ec2-user/startup.log
  EOF

  tags = {
    Name = var.permament_node_tags.name
  }
}
