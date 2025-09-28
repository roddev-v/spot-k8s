resource "aws_instance" "permanent_node" {
  ami                    = var.permanent_node_ami
  instance_type          = var.permanent_node_instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.private_node_sg.id, var.allow_ssh_from_bastion_sg_id]
  key_name               = data.aws_key_pair.manual.key_name

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y nc
    
    # Create simple HTTP response
    cat << 'EOM' > /home/ec2-user/response.txt
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 76

{"message": "Hello World from K8s API Mock!", "status": "success", "port": 6443}
EOM

    # Start netcat HTTP server
    while true; do
      cat /home/ec2-user/response.txt | nc -l -p 6443
    done &
    
    echo "Netcat HTTP server started on port 6443" > /home/ec2-user/startup.log
    sleep 2
    netstat -tlnp | grep 6443 >> /home/ec2-user/startup.log
  EOF

  tags = {
    Name = var.permament_node_tags.name
  }
}

data "aws_key_pair" "manual" {
  key_name = "demo-pem-key"
}
