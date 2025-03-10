output "vault_arn" {
  description = "The ARN of the backup vault"
  sensitive   = true
  value       = try(data.aws_ssm_parameter.this[0].value, null)
}

output "ssm_arn" {
  description = "The ARN of the SSM parameter"
  value       = try(module.ssm[0].arn, null)
}
