locals {
  tags = {
    git     = var.git
    cost    = "shared"
    creator = "terraform"
  }

  trimmed_name = substr(var.name, 0, 43)
  random_name  = try("${local.trimmed_name}-${random_id.this[0].hex}", local.trimmed_name)
}

data "aws_region" "this" {}

resource "random_id" "this" {
  byte_length = 3
}

resource "aws_backup_logically_air_gapped_vault" "this" {
  count              = var.enabled ? 1 : 0
  provider           = aws.target
  name               = var.enable_random_suffix ? local.random_name : local.trimmed_name
  max_retention_days = var.max_retention_days
  min_retention_days = var.min_retention_days
  tags               = merge(local.tags, var.tags)
}

module "ssm" {
  count                     = var.enabled ? 1 : 0
  source                    = "github.com/champ-oss/terraform-aws-ssm.git?ref=v1.0.5-78c79ac"
  git                       = var.git
  enable_resources          = var.enabled
  enabled                   = var.enabled
  enable_random_name_suffix = var.enable_random_suffix
  name                      = var.enable_random_suffix ? local.random_name : local.trimmed_name
  value                     = aws_backup_logically_air_gapped_vault.this[0].arn
  tags                      = merge(local.tags, var.tags)
}