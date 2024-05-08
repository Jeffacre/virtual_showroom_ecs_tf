output "ecs_cluster_name" {
  value = aws_ecs_cluster.ecs_cluster.name
}

output "ecs_service_1" {
  value = aws_ecs_service.docker_image1_service.name
}

output "ecs_service_2" {
  value = aws_ecs_service.docker_image2_service.name
}
