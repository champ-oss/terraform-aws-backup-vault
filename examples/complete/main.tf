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
