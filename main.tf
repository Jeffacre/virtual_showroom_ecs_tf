# main.tf
provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "docker_image1_repo" {
  name = local.container-repository1
  tags = local.tags
}

resource "aws_ecr_repository" "docker_image2_repo" {
  name = local.container-repository2
  tags = local.tags
}

resource "aws_iam_role" "ecs_instance_role" {
  name = local.ecs_instance_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs.amazonaws.com"
        }
      },
    ]
  })

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role_policy_attachment" {
  role       = aws_iam_role.ecs_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = local.ecs_name
  tags = local.tags
}

resource "aws_ecs_task_definition" "docker_image1_task" {
  family                   = "docker_image1-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_instance_role.arn
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = local.container1
    image     = "${aws_ecr_repository.docker_image1_repo.repository_url}:latest"
    essential = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])

  tags = local.tags
}

resource "aws_ecs_task_definition" "docker_image2_task" {
  family                   = "docker_image2-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_instance_role.arn
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = local.container2
    image     = "${aws_ecr_repository.docker_image2_repo.repository_url}:latest"
    essential = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])

  tags = local.tags
}

resource "aws_ecs_service" "docker_image1_service" {
  name            = local.ecs_svc_name1
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.docker_image1_task.arn
  desired_count   = 1

  network_configuration {
    subnets         = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  launch_type = "FARGATE"
  tags = local.tags

  autoscaling {
    min_capacity = 1
    max_capacity = 5

    target_tracking_scaling_policy {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
      target_value           = 80.0
      scale_in_cooldown      = 300
      scale_out_cooldown     = 300
    }
  }
}

resource "aws_ecs_service" "docker_image2_service" {
  name            = local.ecs_svc_name2
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.docker_image2_task.arn
  desired_count   = 1

  network_configuration {
    subnets         = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  launch_type = "FARGATE"
  tags = local.tags

  autoscaling {
    min_capacity = 1
    max_capacity = 5

    target_tracking_scaling_policy {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
      target_value           = 80.0
      scale_in_cooldown      = 300
      scale_out_cooldown     = 300
    }
  }
}
