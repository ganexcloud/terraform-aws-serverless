/**
  *
  * Get your serverless framework application to AWS, the right way.
  */

### Serverless Cloudformation ###
resource "aws_iam_role" "default" {
  name                  = "${var.serverless_service_name}-${var.serverless_stage}-cloudformation"
  assume_role_policy    = var.cloudformation_assume_role_policy == null ? data.aws_iam_policy_document.assume_role_cloudformation.json : var.cloudformation_assume_role_policy
  path                  = "/"
  description           = "Managed by Terraform"
  max_session_duration  = "3600"
  force_detach_policies = "true"
}

resource "aws_iam_policy" "default" {
  name        = "${var.serverless_service_name}-${var.serverless_stage}-cloudformation"
  policy      = data.aws_iam_policy_document.cloudformation.json
  path        = "/"
  description = "Managed by Terraform"
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}

data "aws_iam_policy_document" "cloudformation" {
  statement {
    actions = [
      "iam:GetRole",
      "iam:PassRole",
      "iam:CreateRole",
      "iam:DeleteRole",
      "iam:DetachRolePolicy",
      "iam:AttachRolePolicy",
      "iam:DeleteRolePolicy",
    ]

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.serverless_service_name}-${var.serverless_stage}-${data.aws_region.current.name}-lambdaRole",
    ]
  }

  statement {
    actions = [
      "cloudformation:Describe*",
      "cloudformation:List*",
      "cloudformation:Get*",
      "cloudformation:PreviewStackUpdate",
      "cloudformation:CreateStack",
      "cloudformation:UpdateStack",
    ]

    resources = [
      "arn:aws:cloudformation:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:stack/${var.serverless_service_name}-${var.serverless_stage}*",
    ]
  }

  statement {
    actions = [
      "cloudformation:ValidateTemplate",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "s3:ListAllMyBuckets",
      "s3:CreateBucket",
      "s3:DeleteBucket",
      "s3:DeleteBucketPolicy",
      "s3:GetEncryptionConfiguration",
      "s3:PutEncryptionConfiguration",
      "s3:GetObject",
      "s3:PutBucketPolicy",
    ]

    resources = [
      "arn:aws:s3:::${var.serverless_service_name}-${var.serverless_stage}*",
      "arn:aws:s3:::${var.serverless_service_name}-${var.serverless_stage}*/*"
    ]
  }

  statement {
    actions = [
      "apigateway:GET",
      "apigateway:HEAD",
      "apigateway:OPTIONS",
      "apigateway:PATCH",
      "apigateway:POST",
      "apigateway:PUT",
      "apigateway:DELETE",
      "apigateway:TagResource"
    ]

    resources = [
      "arn:aws:apigateway:${data.aws_region.current.name}::/restapis/*/*",
      "arn:aws:apigateway:${data.aws_region.current.name}::/restapis/*",
      "arn:aws:apigateway:${data.aws_region.current.name}::/restapis",
      "arn:aws:apigateway:${data.aws_region.current.name}::/apis/*/*",
      "arn:aws:apigateway:${data.aws_region.current.name}::/apis/*",
      "arn:aws:apigateway:${data.aws_region.current.name}::/apis",
      "arn:aws:apigateway:${data.aws_region.current.name}::/apikeys",
      "arn:aws:apigateway:${data.aws_region.current.name}::/apikeys/*",
      "arn:aws:apigateway:${data.aws_region.current.name}::/usageplans",
      "arn:aws:apigateway:${data.aws_region.current.name}::/usageplans/*",
      "arn:aws:apigateway:${data.aws_region.current.name}::/tags",
      "arn:aws:apigateway:${data.aws_region.current.name}::/tags/*"
    ]
  }

  statement {
    actions = [
      "logs:DescribeLogGroups",
    ]

    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group::log-stream:*",
    ]
  }

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DeleteLogGroup",
      "logs:DeleteLogStream",
      "logs:DescribeLogStreams",
      "logs:FilterLogEvents",
      "logs:PutRetentionPolicy",
    ]

    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${var.serverless_service_name}-${var.serverless_stage}*:log-stream:*",
    ]
  }

  statement {
    actions = [
      "events:DescribeRule",
      "events:PutRule",
      "events:PutTargets",
      "events:RemoveTargets",
      "events:DeleteRule",
    ]

    resources = [
      "arn:aws:events:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:rule/${var.serverless_service_name}-${var.serverless_stage}*",
    ]
  }

  statement {
    actions = [
      "cloudformation:ListStacks",
      "cloudformation:PreviewStackUpdate",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "lambda:GetFunction",
      "lambda:CreateFunction",
      "lambda:DeleteFunction",
      "lambda:UpdateFunctionConfiguration",
      "lambda:UpdateFunctionCode",
      "lambda:ListVersionsByFunction",
      "lambda:PublishVersion",
      "lambda:CreateAlias",
      "lambda:DeleteAlias",
      "lambda:UpdateAlias",
      "lambda:GetFunctionConfiguration",
      "lambda:AddPermission",
      "lambda:RemovePermission",
      "lambda:InvokeFunction",
      "lambda:ListTags",
      "lambda:ListAliases",
      "lambda:TagResource",
      "lambda:UntagResource",
      "lambda:GetFunctionCodeSigningConfig",
      "lambda:PutFunctionConcurrency",
      "lambda:DeleteFunctionEventInvokeConfig",
      "lambda:PutFunctionEventInvokeConfig"
    ]

    resources = [
      "arn:aws:lambda:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:function:${var.serverless_service_name}-${var.serverless_stage}*",
    ]
  }

  statement {
    actions = [
      "lambda:GetLayerVersion",
      "lambda:DeleteEventSourceMapping",
      "lambda:CreateEventSourceMapping",
      "lambda:GetEventSourceMapping",
      "lambda:UpdateEventSourceMapping",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeVpcs",
      "ec2:DescribeNetworkInterfaces",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "cloudwatch:PutMetricAlarm",
      "cloudwatch:DeleteAlarm",
    ]

    resources = [
      "arn:aws:cloudwatch:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:alarm:${var.serverless_service_name}-${var.serverless_stage}*",
    ]
  }

}

data "aws_iam_policy_document" "assume_role_cloudformation" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["cloudformation.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "cloudformation_additional_policy" {
  count  = var.cloudformation_additional_policy != null ? 1 : 0
  name   = "${var.serverless_service_name}-${var.serverless_stage}-cloudformation-additional-policy"
  policy = var.cloudformation_additional_policy
}

resource "aws_iam_role_policy_attachment" "cloudformation_additional_policy_attachment" {
  count      = var.cloudformation_additional_policy != null ? 1 : 0
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.cloudformation_additional_policy[0].arn
}

### Serverless Deploy Policy ###
resource "aws_iam_role" "deploy" {
  count                 = var.create_deploy_iam_role ? 1 : 0
  name                  = "${var.serverless_service_name}-${var.serverless_stage}-deploy"
  assume_role_policy    = var.deploy_assume_role_policy
  path                  = "/"
  description           = "Managed by Terraform"
  max_session_duration  = "3600"
  force_detach_policies = "true"
}

resource "aws_iam_policy" "deploy" {
  count  = var.create_deploy_iam_role || var.create_deploy_iam_user ? 1 : 0
  name   = "${var.serverless_service_name}-${var.serverless_stage}-deploy"
  path   = "/"
  policy = data.aws_iam_policy_document.policy_deploy.json
}

resource "aws_iam_group" "deploy" {
  count = length(var.deploy_group_users) > 0 ? 1 : 0
  name  = "${var.serverless_service_name}-${var.serverless_stage}-deploy"
}

resource "aws_iam_group_membership" "this" {
  count = length(var.deploy_group_users) > 0 ? 1 : 0
  group = aws_iam_group.deploy[0].name
  name  = "${var.serverless_service_name}-${var.serverless_stage}-deploy"
  users = var.deploy_group_users
}

resource "aws_iam_group_policy_attachment" "deploy" {
  count      = length(var.deploy_group_users) > 0 ? 1 : 0
  group      = aws_iam_group.deploy[0].name
  policy_arn = aws_iam_policy.deploy[0].arn
  depends_on = [aws_iam_policy.deploy]
}

resource "aws_iam_role_policy_attachment" "deploy" {
  count      = var.create_deploy_iam_role ? 1 : 0
  role       = aws_iam_role.deploy[0].name
  policy_arn = aws_iam_policy.deploy[0].arn
}

data "aws_iam_policy_document" "policy_deploy" {
  statement {
    actions = [
      "iam:PassRole",
    ]

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.serverless_service_name}-${var.serverless_stage}-cloudformation",
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.serverless_service_name}-${var.serverless_stage}-*-lambdaRole",
    ]
  }

  statement {
    actions = [
      "s3:ListBucketVersions",
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:DeleteObject",
      "s3:CreateBucket",
      "s3:DeleteBucket",
      "s3:GetEncryptionConfiguration",
      "s3:PutEncryptionConfiguration",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::${var.serverless_service_name}-${var.serverless_stage}*",
      "arn:aws:s3:::${var.serverless_service_name}-${var.serverless_stage}*/*"
    ]
  }

  statement {
    actions = [
      "cloudformation:CreateStack",
      "cloudformation:UpdateStack",
      "cloudformation:DeleteStack",
      "cloudformation:CreateChangeSet",
      "cloudformation:ExecuteChangeSet",
      "cloudformation:DeleteChangeSet"
    ]

    resources = [
      "arn:aws:cloudformation:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:stack/${var.serverless_service_name}-${var.serverless_stage}*",
    ]
  }

  statement {
    actions = [
      "cloudformation:Describe*",
      "cloudformation:List*",
      "cloudformation:Get*",
      "cloudformation:PreviewStackUpdate",
      "cloudformation:ValidateTemplate",
      "acm:ListCertificates"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "lambda:GetFunction",
      "lambda:ListVersionsByFunction",
      "lambda:ListAliases"
    ]

    resources = [
      "arn:aws:lambda:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:function:${var.serverless_service_name}-${var.serverless_stage}*",
    ]
  }

  statement {
    actions = [
      "apigateway:GET",
      "apigateway:HEAD",
      "apigateway:OPTIONS",
      "apigateway:PATCH",
      "apigateway:POST",
      "apigateway:PUT",
      "apigateway:DELETE",
    ]

    resources = [
      "arn:aws:apigateway:*::/restapis",
      "arn:aws:apigateway:*::/restapis/*",
    ]
  }

  statement {
    actions = [
      "apigateway:POST"
    ]

    resources = [
      "arn:aws:apigateway:${data.aws_region.current.name}::/domainnames"
    ]
  }

  statement {
    actions = [
      "apigateway:GET",
      "apigateway:DELETE"
    ]

    resources = [
      "arn:aws:apigateway:${data.aws_region.current.name}::/domainnames/*"
    ]
  }

  statement {
    actions = [
      "apigateway:PATCH",
      "apigateway:POST"
    ]

    resources = [
      "arn:aws:apigateway:${data.aws_region.current.name}::/domainnames/*/basepathmappings",
      "arn:aws:apigateway:${data.aws_region.current.name}::/domainnames/*/basepathmappings/*",
      "arn:aws:apigateway:${data.aws_region.current.name}::/domainnames/*/apimappings",
      "arn:aws:apigateway:${data.aws_region.current.name}::/domainnames/*/apimappings/*"
    ]
  }

  statement {
    actions = [
      "apigateway:GET",
      "apigateway:DELETE"
    ]

    resources = [
      "arn:aws:apigateway:${data.aws_region.current.name}::/restapis/*/*",
      "arn:aws:apigateway:${data.aws_region.current.name}::/restapis/*",
      "arn:aws:apigateway:${data.aws_region.current.name}::/restapis",
      "arn:aws:apigateway:${data.aws_region.current.name}::/apikeys",
      "arn:aws:apigateway:${data.aws_region.current.name}::/apikeys/*",
      "arn:aws:apigateway:${data.aws_region.current.name}::/usageplans",
      "arn:aws:apigateway:${data.aws_region.current.name}::/usageplans/*"
    ]
  }
}

resource "aws_iam_policy" "deploy_additional_policy" {
  count  = var.deploy_additional_policy != null ? 1 : 0
  name   = "${var.serverless_service_name}-${var.serverless_stage}-deploy-additional-policy"
  policy = var.deploy_additional_policy
}

resource "aws_iam_group_policy_attachment" "deploy_additional_policy_attachment" {
  count      = var.deploy_additional_policy != null && length(var.deploy_group_users) > 0 ? 1 : 0
  group      = aws_iam_group.deploy[0].name
  policy_arn = aws_iam_policy.deploy_additional_policy[0].arn
  depends_on = [aws_iam_policy.deploy_additional_policy]
}

resource "aws_iam_role_policy_attachment" "deploy_additional_policy_attachment" {
  count      = var.deploy_additional_policy != null ? 1 : 0
  role       = aws_iam_role.deploy[0].name
  policy_arn = aws_iam_policy.deploy_additional_policy[0].arn
}

resource "aws_iam_user" "deploy" {
  count = var.create_deploy_iam_user ? 1 : 0
  name  = "${var.serverless_service_name}-${var.serverless_stage}-deploy"
  path  = "/"
}

resource "aws_iam_access_key" "deploy" {
  count = var.create_deploy_iam_user ? 1 : 0
  user  = aws_iam_user.deploy[0].name
}

resource "aws_iam_user_policy_attachment" "deploy_iam" {
  count      = var.create_deploy_iam_user ? 1 : 0
  user       = aws_iam_user.deploy[0].name
  policy_arn = aws_iam_policy.deploy[0].arn
}

resource "aws_iam_user_policy_attachment" "deploy_additional_policy_attachment_iam" {
  count      = var.create_deploy_iam_user && var.deploy_additional_policy != null ? 1 : 0
  user       = aws_iam_user.deploy[0].name
  policy_arn = aws_iam_policy.deploy_additional_policy[0].arn
}

### Serverless Lambda Role ###
resource "aws_iam_role" "lambda" {
  name               = "${var.serverless_service_name}-${var.serverless_stage}-${data.aws_region.current.name}-lambdaRole"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_policy" "lambda" {
  name   = "${var.serverless_service_name}-${var.serverless_stage}-lambda-execution"
  policy = data.aws_iam_policy_document.lambda.json
}

data "aws_iam_policy_document" "lambda" {
  statement {
    actions   = ["logs:CreateLogStream"]
    resources = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${var.serverless_service_name}-${var.serverless_stage}*:*"]
  }

  statement {
    actions   = ["logs:PutLogEvents"]
    resources = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${var.serverless_service_name}-${var.serverless_stage}*:*:*"]
  }

  statement {
    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
      "ec2:AssignPrivateIpAddresses",
      "ec2:UnassignPrivateIpAddresses"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.lambda.arn
}

resource "aws_iam_policy" "lambda_additional_policy" {
  count  = var.lambda_additional_policy != null ? 1 : 0
  name   = "${var.serverless_service_name}-${var.serverless_stage}-lambda-additional-policy"
  policy = var.lambda_additional_policy
}

resource "aws_iam_role_policy_attachment" "lambda_additional_policy_attachment" {
  count      = var.lambda_additional_policy != null ? 1 : 0
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.lambda_additional_policy[0].arn
}

### S3 Bucket ###
resource "aws_s3_bucket" "this" {
  bucket = "${var.serverless_service_name}-${var.serverless_stage}-${data.aws_region.current.name}-serverless"
  acl    = "private"
}
