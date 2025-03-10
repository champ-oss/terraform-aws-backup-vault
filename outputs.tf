
output "vault_arn" {
  description = "The ARN of the backup vault"
  value       = try(data.aws_ssm_parameters_by_path.this[0].values[0], null)
}

output "ssm_arn" {
  description = "The ARN of the SSM parameter"
  value       = try(module.ssm[0].arn, null)
}
