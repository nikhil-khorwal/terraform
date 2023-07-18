module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "2.23.0"

  function_name          = local.lambda_function_name
  handler                = local.lambda_handler
  local_existing_package = "../generator.zip"
  runtime                = "nodejs14.x"
  publish                = true
  timeout                = 120
  memory_size            = 2048

  create_package = false



  environment_variables = {
    PRIVATE_FILES_BUCKET_NAME = "bunker-planner-private-pdf"
    REGION                    = var.aws_region
    PUBLIC_FILES_BUCKET_NAME  = "bunker-planner-public-pdf"
  }

  tags = merge(local.required_tags, {
    function = "pdf lambda for ${var.application_name}"
  })
}


module "alias" {
  source  = "terraform-aws-modules/lambda/aws//modules/alias"
  version = "2.22.0"

  name = var.application_name

  use_existing_alias = false
  refresh_alias      = false

  function_name    = module.lambda_function.lambda_function_name
  function_version = module.lambda_function.lambda_function_version

}
