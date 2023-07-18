
locals {
  environment = terraform.workspace

  aws_accounts = {
    test = "928173580537"
  }

  required_tags = {
    team        = var.team
    environment = local.environment
    application = var.application_name
    function    = var.application_function
    user-data   = var.contains_user_data
    repo-link   = var.repo_link
  }

  aws_account_id                    = lookup(local.aws_accounts, local.environment, "928173580537")
  api_gateway_route_key             = var.api_gateway_route_key == "" ? "ANY /${var.application_name}/{proxy+}" : var.api_gateway_route_key
  application_name_with_underscores = replace(var.application_name, "-", "_")
  lambda_function_name              = replace(title(replace("${var.application_name}-LambdaFunction", "-", " ")), " ", "")
  lambda_handler                    = var.lambda_handler
  deployment_group_name             = "${var.application_name}-LambdaFunctionDeploymentGroup-${random_string.random.result}"
  private_subnet_prefix             = "${local.environment}-vpc-private-eu-west-1"
}
