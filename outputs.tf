output "vault_arn" {
  description = "The ARN of the backup vault"
  value       = nonsensitive(try(data.aws_ssm_parameters_by_path.this[0].values[0], null))
}

output "ssm_arn" {
  description = "The ARN of the SSM parameter"
  value       = try(aws_ssm_parameter.this[0].arn, null)
}
