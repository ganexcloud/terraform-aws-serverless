variable "serverless_service_name" {
  description = "Serverless name of service (function)"
  type        = string
}

variable "serverless_stage" {
  description = "Serverless stage (environment)"
  type        = string
}

variable "trusted_role_arns" {
  description = "(Optional) ARNs of AWS entities who can assume these role"
  type        = list(string)
  default     = []
}

variable "cloudformation_additional_policy" {
  description = "(Optional) Cloudformation additional policy. This is a JSON formatted string."
  type        = string
  default     = null
}

variable "deploy_additional_policy" {
  description = "(Optional) Deploy role additional policy. This is a JSON formatted string."
  type        = string
  default     = null
}

variable "lambda_additional_policy" {
  description = "(Optional) Lambda role additional policy. This is a JSON formatted string."
  type        = string
  default     = null
}

variable "deploy_group_users" {
  description = "(Optional) Name of Iam users to add a deploy group"
  type        = list(string)
  default     = []
}

variable "create_deploy_iam_user" {
  description = "(Optional) Cloudformation additional policy. This is a JSON formatted string."
  type        = bool
  default     = false
}
