variable "serverless_service_name" {
  description = "(Required) Serverless name of service (function)"
  type        = string
}

variable "serverless_stage" {
  description = "(Required) Serverless stage (environment)"
  type        = string
}

variable "cloudformation_additional_policy" {
  description = "(Optional) Cloudformation additional policy."
  type        = string
  default     = null
}

variable "deploy_additional_policy" {
  description = "(Optional) Deploy additional policy."
  type        = string
  default     = null
}

variable "lambda_additional_policy" {
  description = "(Optional) Lambda role additional policy."
  type        = string
  default     = null
}

variable "deploy_group_users" {
  description = "(Optional) Name of Iam users to add a deploy group"
  type        = list(string)
  default     = []
}

variable "create_deploy_iam_role" {
  description = "(Optional) Create deploy iam role."
  type        = bool
  default     = false
}

variable "create_deploy_iam_user" {
  description = "(Optional) Create deploy iam role."
  type        = bool
  default     = false
}

variable "deploy_assume_role_policy" {
  description = "(Optional) Required if `create_deploy_iam_role` is true. The policy that grants an entity permission to assume the role."
  type        = string
  default     = null
}

variable "cloudformation_assume_role_policy" {
  description = "(Optional) Required if `create_deploy_iam_role` is true. The policy that grants an entity permission to assume the role."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}