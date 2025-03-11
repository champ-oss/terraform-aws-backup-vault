output "vault_arn" {
  description = "The ARN of the backup vault"
  value       = try(data.aws_ssm_parameter.this[0].insecure_value, null)
}

output "ssm_arn" {
  description = "The ARN of the SSM parameter"
  value       = try(aws_ssm_parameter.this[0].arn, null)
}
