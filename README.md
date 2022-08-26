<!-- BEGIN_TF_DOCS -->

Get your serverless framework application to AWS, the right way.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_group.deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.deploy_additional_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.cloudformation_additional_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.deploy_additional_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.lambda_additional_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudformation_additional_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.deploy_additional_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_additional_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.deploy_additional_policy_attachment_iam](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.deploy_iam](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_cloudformation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cloudformation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.lambda_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.policy_deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudformation_additional_policy"></a> [cloudformation\_additional\_policy](#input\_cloudformation\_additional\_policy) | (Optional) Cloudformation additional policy. | `string` | `null` | no |
| <a name="input_create_deploy_iam_role"></a> [create\_deploy\_iam\_role](#input\_create\_deploy\_iam\_role) | (Optional) Create deploy iam role. | `bool` | `false` | no |
| <a name="input_create_deploy_iam_user"></a> [create\_deploy\_iam\_user](#input\_create\_deploy\_iam\_user) | (Optional) Create deploy iam role. | `bool` | `false` | no |
| <a name="input_deploy_additional_policy"></a> [deploy\_additional\_policy](#input\_deploy\_additional\_policy) | (Optional) Deploy additional policy. | `string` | `null` | no |
| <a name="input_deploy_assume_role_policy"></a> [deploy\_assume\_role\_policy](#input\_deploy\_assume\_role\_policy) | (Optional) Required if `create_deploy_iam_role` is true. The policy that grants an entity permission to assume the role. | `string` | `null` | no |
| <a name="input_deploy_group_users"></a> [deploy\_group\_users](#input\_deploy\_group\_users) | (Optional) Name of Iam users to add a deploy group | `list(string)` | `[]` | no |
| <a name="input_lambda_additional_policy"></a> [lambda\_additional\_policy](#input\_lambda\_additional\_policy) | (Optional) Lambda role additional policy. | `string` | `null` | no |
| <a name="input_serverless_service_name"></a> [serverless\_service\_name](#input\_serverless\_service\_name) | (Required) Serverless name of service (function) | `string` | n/a | yes |
| <a name="input_serverless_stage"></a> [serverless\_stage](#input\_serverless\_stage) | (Required) Serverless stage (environment) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | The ARN of the S3 Bucket project. |
| <a name="output_cloudformation_role_arn"></a> [cloudformation\_role\_arn](#output\_cloudformation\_role\_arn) | The ARN of Cloudformation IAM role |
| <a name="output_cloudformation_role_name"></a> [cloudformation\_role\_name](#output\_cloudformation\_role\_name) | The Name of Cloudformation IAM role |
| <a name="output_deploy_iam_user_arn"></a> [deploy\_iam\_user\_arn](#output\_deploy\_iam\_user\_arn) | The ARN of Deploy IAM role |
| <a name="output_deploy_iam_user_name"></a> [deploy\_iam\_user\_name](#output\_deploy\_iam\_user\_name) | The Name of Deploy IAM role |
| <a name="output_deploy_role_arn"></a> [deploy\_role\_arn](#output\_deploy\_role\_arn) | The ARN of Deploy IAM role |
| <a name="output_deploy_role_name"></a> [deploy\_role\_name](#output\_deploy\_role\_name) | The Name of Deploy IAM role |
| <a name="output_lambda_role_arn"></a> [lambda\_role\_arn](#output\_lambda\_role\_arn) | The ARN of Lambda IAM role |
| <a name="output_lambda_role_name"></a> [lambda\_role\_name](#output\_lambda\_role\_name) | The Name of Lambda IAM role |
<!-- END_TF_DOCS -->