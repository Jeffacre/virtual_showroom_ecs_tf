# local.tf
locals {
  # terraform_path = var.terraform_path
  # docker_image1_path = var.docker_image1_path
  # docker_image2_path = var.docker_image2_path
  # s3_bucket_name = var.s3_bucket_name
  # project = var.project
  # sdlc = var.sdlc
  # version = var.version
  # company = var.company
  # chargeback = var.chargeback
  # region = var.region
  # locality = var.locality

  # VPC
  vpn_name = "aws"+"-"+"vpc"+"-"+(var.project)+(var.version)

  # ECS
  ecs_name = "aws"+"-"+"ecs"+"-"+(var.project)+(var.version)
  ecs_svc_name1 = "aws"+"-"+"ecsvc"+"-"+(var.project)+"01"
  ecs_svc_name2 = "aws"+"-"+"ecsvc"+"-"+(var.project)+"02"
  ecs_instance_role_name = "aws"+"-"+"ecsrn"+"-"+(var.project)+"01"

  # ECR
  ecr_name = "aws"+"-"+"ecr"+"-"+(var.project)+(var.version)

  # S3
  s3_name1 = "aws"+"-"+"s3"+"-"+(var.project)+(var.version)

  # Containers
  container1 = (var.project)+"-"+"virtualshowroom"+"-"+"01" 
  container2 = (var.project)+"-"+"virtualshowroom"+"-"+"02"

  # Container Repositories
  container-repository1 = (var.project)+"-"+"virtualshowroom"+"-"+"01"
  container-repository2 = (var.project)+"-"+"virtualshowroom"+"-"+"02"

  tags = merge(
    var.instance_tags,
    {
      Project     = var.project
      Environment = var.sdlc
      Company     = var.company
      Chargeback  = var.chargeback
      Region      = var.locality
      Version     = var.version
    }
  )
}
