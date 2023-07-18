
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.63"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = "AKIA5QG3U4D4U4C7PBF4"
  secret_key = "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"
}
