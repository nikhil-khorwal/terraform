module "deploy" {
  source  = "terraform-aws-modules/lambda/aws//modules/deploy"
  version = "2.23.0"

  alias_name    = module.alias.lambda_alias_name
  function_name = module.lambda_function.lambda_function_name

  target_version = module.lambda_function.lambda_function_version

  create_app = true
  app_name   = var.application_name

  create_deployment_group = true
  deployment_group_name   = local.deployment_group_name

  auto_rollback_events = [
    "DEPLOYMENT_FAILURE",
    "DEPLOYMENT_STOP_ON_ALARM"
  ]

  create_deployment          = true
  wait_deployment_completion = true

  depends_on = [
    module.alias
  ]
}