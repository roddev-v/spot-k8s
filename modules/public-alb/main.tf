resource "aws_security_group" "spot_k8s_public_alb_sg" {
  vpc_id = var.main_vpc_id

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # open to the world
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.public_tags.alb_security_group
  }
}

resource "aws_lb" "spot_k8s_public_alb" {
  load_balancer_type = "application"
  subnets            = [var.public_subnet_0_id, var.public_subnet_1_id]
  security_groups    = [aws_security_group.spot_k8s_public_alb_sg.id]

  tags = {
    Name = var.public_tags.alb
  }
}

# # ----------------------
# # Target Group for ALB (TCP to k3s API)
# # ----------------------
# resource "aws_lb_target_group" "k8s_api_tg" {
#   name        = "k8s-api-tg"
#   port        = 6443
#   protocol    = "TCP"
#   target_type = "ip"
#   vpc_id      = var.vpc_id
# }

# # ----------------------
# # Listener for ALB
# # ----------------------
# resource "aws_lb_listener" "k8s_api_listener" {
#   load_balancer_arn = aws_lb.k8s_api_alb.arn
#   port              = 6443
#   protocol          = "TCP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.k8s_api_tg.arn
#   }
# }
