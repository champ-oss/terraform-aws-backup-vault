locals {
  tags = {
    git     = var.git
    cost    = "shared"
    creator = "terraform"
  }

  trimmed_name = substr(var.name, 0, 43)
  random_name  = try("${local.trimmed_name}-${random_id.this[0].hex}", local.trimmed_name)
  ssm_name     = var.enable_random_suffix ? "${var.ssm_prefix}${local.random_name}" : "${var.ssm_prefix}${local.trimmed_name}"
}

resource "random_id" "this" {
  count       = var.enabled && var.create_vault ? 1 : 0
  byte_length = 3
}

resource "aws_backup_logically_air_gapped_vault" "this" {
  count              = var.enabled && var.create_vault ? 1 : 0
  provider           = aws.target
  name               = var.enable_random_suffix ? local.random_name : local.trimmed_name
  max_retention_days = var.max_retention_days
  min_retention_days = var.min_retention_days
  tags               = merge(local.tags, var.tags)
}

resource "aws_ssm_parameter" "this" {
  count          = var.enabled && var.create_vault ? 1 : 0
  name           = local.ssm_name
  type           = "String"
  insecure_value = aws_backup_logically_air_gapped_vault.this[0].arn
  tags           = merge(local.tags, var.tags)
}

data "aws_ssm_parameter" "this" {
  depends_on = [aws_ssm_parameter.this]
  count      = var.enabled ? 1 : 0
  name       = local.ssm_name
}