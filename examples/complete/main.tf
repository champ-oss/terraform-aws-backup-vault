provider "aws" {
  alias  = "aws.target"
  region = "us-west-1"
}

module "this" {
  source = "../../"
  git    = "terraform-aws-backup-vault"
  providers = {
    aws.target = aws.target
  }
}

output "outputs" {
  value = module.this
}