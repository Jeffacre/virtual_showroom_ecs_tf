variable "instance_type" {
  description = "The type of instance to deploy"
}

variable "windows_ami_id" {
  description = "AMI ID for the Windows Server"
}

variable "your_ip_address" {
  description = "Your public IP address for secure RDP access"
}

variable "project" {
  description = "Project name"
}

variable "sdlc" {
  description = "Software Development Life Cycle stage"
}

variable "version" {
  description = "Version of the deployment"
}

variable "company" {
  description = "Company name"
}

variable "chargeback" {
  description = "Chargeback code or identifier"
}

variable "region" {
  description = "AWS region for the deployment"
}

variable "locality" {
  description = "AWS reglocalityion for the deployment"
}

variable "instance_tags" {
  description = "Tags to assign to the instance"
  type        = map(string)
}

variable "terraform_path" {
  description = "Path to Terraform configuration"
}

variable "docker_image1_path" {
  description = "Path to Docker Image 1"
}

variable "docker_image2_path" {
  description = "Path to Docker Image 2"
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
}

variable "map_public_ip_on_launch" {
  description = "map the public ip on launch"
}

# Cloudwatch Variables
variable "cf_evaluation_periods" {
  description = "cloudwatch evaluation period"
}

variable "cf_period" {
  description = "cloudwatch period"
}

variable "cf_threshold80" {
  description = "cloudwatch threshold"
}

variable "cf_threshold60" {
  description = "cloudwatch threshold"
}