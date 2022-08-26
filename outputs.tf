output "cloudformation_role_arn" {
  value       = join(",", aws_iam_role.default.*.arn)
  description = "The ARN of Cloudformation IAM role "
}

output "cloudformation_role_name" {
  value       = join(",", aws_iam_role.default.*.name)
  description = "The Name of Cloudformation IAM role "
}

output "deploy_role_arn" {
  value       = var.create_deploy_iam_role ? join(",", aws_iam_role.deploy.*.arn) : null
  description = "The ARN of Deploy IAM role "
}

output "deploy_role_name" {
  value       = var.create_deploy_iam_role ? join(",", aws_iam_role.deploy.*.name) : null
  description = "The Name of Deploy IAM role "
}

output "deploy_iam_user_arn" {
  value       = var.create_deploy_iam_user ? join(",", aws_iam_user.deploy.*.arn) : null
  description = "The ARN of Deploy IAM role "
}

output "deploy_iam_user_name" {
  value       = var.create_deploy_iam_user ? join(",", aws_iam_user.deploy.*.name) : null
  description = "The Name of Deploy IAM role "
}

output "lambda_role_arn" {
  value       = join(",", aws_iam_role.lambda.*.arn)
  description = "The ARN of Lambda IAM role "
}

output "lambda_role_name" {
  value       = join(",", aws_iam_role.lambda.*.name)
  description = "The Name of Lambda IAM role "
}

output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "The ARN of the S3 Bucket project."
}
