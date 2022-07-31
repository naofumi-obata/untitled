resource "aws_ecs_cluster" "untitled" {
  name = "untitled-cluster"

  # setting {
  #   name  = "containerInsights"
  #   value = "enabled"
  # }
}


resource "aws_ecs_service" "untitled-service" {
  name            = "untitled-service"
  cluster         = aws_ecs_cluster.untitled.id
  task_definition = aws_ecs_task_definition.untitled.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = ["${aws_subnet.untitled-1a.id}"]
    security_groups  = ["${aws_security_group.untitled-security-group.id}"]
    assign_public_ip = true
  }

}


resource "aws_security_group" "untitled-security-group" {
  name   = "untitled-security-group"
  vpc_id = aws_vpc.untitled.id
}

resource "aws_security_group_rule" "untitled-security-roule-ingress" {
  security_group_id = aws_security_group.untitled-security-group.id

  type        = "ingress"
  from_port   = var.mapping_port
  to_port     = var.mapping_port
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "untitled-security-roule-egress" {
  security_group_id = aws_security_group.untitled-security-group.id

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}