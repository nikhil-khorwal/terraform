
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.63.0"
    }
  }
}

provider "aws" {
  region     = local.aws_region
  access_key = "AKIA5QG3U4D4QJKJXBN6"
  secret_key = "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"

}


locals {
  my_function_source = "../generator.zip"
}

resource "aws_s3_bucket" "mybucket" {
  acl = "private"
}

resource "aws_s3_object" "my_function" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "${filemd5(local.my_function_source)}.zip"
  source = local.my_function_source
}

module "lambda_function_existing_package_s3" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my-lambda-existing-package-local"
  description   = "My awesome lambda function"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"

  create_package = false
  s3_existing_package = {
    bucket = aws_s3_bucket.mybucket.id
    key    = aws_s3_object.my_function.id
  }
}
