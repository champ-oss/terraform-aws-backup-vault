terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
      configuration_aliases = [ aws.target ]
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }
  }
}
