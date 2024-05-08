resource "aws_kms_key" "terraform_secrets_key" {
  description             = "KMS Key for encrypting Terraform secrets"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action = "kms:*"
        Resource = "*"
      }
    ]
  })
  tags = local.tags
}

resource "aws_kms_alias" "terraform_secrets_key_alias" {
  name    = var.kms_key_alias
  target_key_id = aws_kms_key.terraform_secrets_key.key_id
}

data "aws_caller_identity" "current" {}
