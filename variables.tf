variable "instance_type" {
  type        = string
  description = "The type of instance to deploy"
}

variable "windows_ami_id" {
  type        = string
  description = "AMI ID for the Windows Server"
}

variable "your_ip_address" {
  type        = string
  description = "Your public IP address for secure RDP access"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "sdlc" {
  type        = string
  description = "Software Development Life Cycle stage"
}

variable "version" {
  type        = string
  description = "Version of the deployment"
}

variable "company" {
  type        = string
  description = "Company name"
}

variable "chargeback" {
  type        = string
  description = "Chargeback code or identifier"
}

variable "region" {
  type        = string
  description = "AWS region for the deployment"
}

variable "locality" {
  type        = string
  description = "AWS reglocalityion for the deployment"
}

variable "instance_tags" {
  description = "Tags to assign to the instance"
  type        = map(string)
}

variable "terraform_path" {
  type        = string
  description = "Path to Terraform configuration"
}

variable "docker_image1_path" {
  type        = string
  description = "Path to Docker Image 1"
}

variable "docker_image2_path" {
  type        = string
  description = "Path to Docker Image 2"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "map_public_ip_on_launch" {
  type        = string
  description = "map the public ip on launch"
}

# Cloudwatch Variables
variable "cf_evaluation_periods" {
  type        = string
  description = "cloudwatch evaluation period"
}

variable "cf_period" {
  type        = string
  description = "cloudwatch period"
}

variable "cf_threshold80" {
  type        = string
  description = "cloudwatch threshold"
}

variable "cf_threshold60" {
  type        = string
  description = "cloudwatch threshold"
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
}

variable "kms_key_alias" {
  description = "KMS Key alias for encrypting the secret"
  type        = string
  default     = "alias/terraform-secrets-key"
}