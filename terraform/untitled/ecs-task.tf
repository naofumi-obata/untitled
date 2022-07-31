data "aws_iam_role" "task_execution" {
  name = "ecsTaskExecutionRole"
}


resource "aws_ecs_task_definition" "untitled" {
  family                   = "untitled-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = data.aws_iam_role.task_execution.arn
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "untitled",
    "image": "${var.docker_image_url}",
    "essential": true
  }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"
  }
}