output "aws_region" {
  description = "AWS region name"
  value       = data.aws_region.this.name
}

output "vault_arn" {
  description = "The ARN of the backup vault"
  value       = try(aws_backup_logically_air_gapped_vault.this[0].arn, null)
}

output "ssm_arn" {
  description = "The ARN of the SSM parameter"
  value       = try(module.ssm[0].arn, null)
}
