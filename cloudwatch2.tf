resource "aws_cloudwatch_metric_alarm" "docker_image1_cpu_alarm_high" {
  alarm_name          = "docker_image1_cpu_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.cf_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = var.cf_period
  statistic           = "Average"
  threshold           = 80.0
  alarm_description   = "Triggered when CPU utilization >= 80% for docker_image1 service"
  dimensions = {
    ClusterName = aws_ecs_cluster.ecs_cluster.name
    ServiceName = aws_ecs_service.docker_image1_service.name
  }
  tags = local.tags
}

resource "aws_cloudwatch_metric_alarm" "docker_image1_cpu_alarm_low" {
  alarm_name          = "docker_image1_cpu_low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.cf_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = var.cf_period
  statistic           = "Average"
  threshold           = 60.0
  alarm_description   = "Triggered when CPU utilization <= 60% for docker_image1 service"
  dimensions = {
    ClusterName = aws_ecs_cluster.ecs_cluster.name
    ServiceName = aws_ecs_service.docker_image1_service.name
  }
  tags = local.tags
}

resource "aws_cloudwatch_metric_alarm" "docker_image2_cpu_alarm_high" {
  alarm_name          = "docker_image2_cpu_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.cf_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = var.cf_period
  statistic           = "Average"
  threshold           = 60.0
  alarm_description   = "Triggered when CPU utilization >= 80% for docker_image2 service"
  dimensions = {
    ClusterName = aws_ecs_cluster.ecs_cluster.name
    ServiceName = aws_ecs_service.docker_image2_service.name
  }
  tags = local.tags
}

resource "aws_cloudwatch_metric_alarm" "docker_image2_cpu_alarm_low" {
  alarm_name          = "docker_image2_cpu_low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = ar.cf_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = var.cf_period
  statistic           = "Average"
  threshold           = 60.0
  alarm_description   = "Triggered when CPU utilization <= 60% for docker_image2 service"
  dimensions = {
    ClusterName = aws_ecs_cluster.ecs_cluster.name
    ServiceName = aws_ecs_service.docker_image2_service.name
  }
  tags = local.tags
}

resource "aws_cloudwatch_dashboard" "ecs_cluster_dashboard" {
  dashboard_name = "ecs-cluster-dashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type    = "metric"
        x       = 0
        y       = 0
        width   = 12
        height  = 6
        properties = {
          metrics = [
            ["AWS/ECS", "CPUUtilization", "ClusterName", aws_ecs_cluster.ecs_cluster.name, "ServiceName", aws_ecs_service.docker_image1_service.name]
          ]
          period  = 300
          stat    = "Average"
          region  = var.region
          title   = "Docker Image 1 Service CPU Utilization"
        }
      },
      {
        type    = "metric"
        x       = 0
        y       = 6
        width   = 12
        height  = 6
        properties = {
          metrics = [
            ["AWS/ECS", "CPUUtilization", "ClusterName", aws_ecs_cluster.ecs_cluster.name, "ServiceName", aws_ecs_service.docker_image2_service.name]
          ]
          period  = 300
          stat    = "Average"
          region  = var.region
          title   = "Docker Image 2 Service CPU Utilization"
        }
      }
    ]
  })
  tags = local.tags
}
