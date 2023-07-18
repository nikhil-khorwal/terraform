variable "aws_region" {
  description = "Default region for spawning resources"
  type        = string
  default     = "eu-west-1"
}

variable "aws_iam_role" {
  description = "Name of AWS IAM role with administator access to the AWS account"
  type        = string
  default     = "OrganizationAccountAccessRole"
}

variable "team" {
  description = "Name/email of the owning team [e.g. site-reliability, data-and-integration, core-team]"
  type        = string
  default     = "cloud-crew"
}

variable "application_name" {
  description = "application name, eg. bunker-prices"
  type        = string
}

variable "contains_user_data" {
  description = "Indicates wheather the application/service component stores any user data"
  type        = bool
  default     = false
}


variable "application_function" {
  description = "Function of the component in the application/service"
  type        = string
}

variable "lambda_handler" {
  description = "lambda_handler"
  type        = string
  default     = ""
}

variable "api_gateway_route_key" {
  description = "route key, if not set, this defaults to ANY /<APPLICATION_NAME>/{proxy+}"
  type        = string
  default     = ""
}
variable "repo_link" {
  description = "Url to the repository of the application/service"
  type        = string
}