provider "aws" {
  alias  = "usw1"
  region = "us-west-1"
}

module "this" {
  source       = "../../"
  git          = "terraform-aws-backup-vault"
  create_vault = true
  providers = {
    aws.target = aws.usw1
  }
}

output "outputs" {
  value = module.this
}


# import {
#   to = module.this.aws_backup_logically_air_gapped_vault.this[0]
#   id = "backup-vault-default"
# }
#
# import {
#   to = module.this.aws_ssm_parameter.this[0]
#   id = "backup-vault-default"
# }