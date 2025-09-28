resource "aws_lb" "spot_k8s_public_nlb" {
  load_balancer_type = "network"
  subnets            = [var.public_subnet_0_id, var.public_subnet_1_id]

  tags = {
    Name = var.public_tags.nlb
  }
}

resource "aws_lb_target_group" "spot_k8s_target_group" {
  port        = 6443
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = var.main_vpc_id


  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 6
    interval            = 10
    port                = "6443"
    protocol            = "TCP"
  }

  tags = {
    Name = var.public_tags.nlb_target_group
  }
}

resource "aws_lb_target_group_attachment" "spot_k8s_target_group_attachment" {
  target_group_arn = aws_lb_target_group.spot_k8s_target_group.arn
  target_id        = var.permanent_node_ip
  port             = 6443
}

resource "aws_lb_listener" "spot_k8s_api_listener" {
  load_balancer_arn = aws_lb.spot_k8s_public_nlb.arn
  port              = 6443
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.spot_k8s_target_group.arn
  }
}
