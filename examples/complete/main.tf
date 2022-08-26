provider "aws" {
  region = "us-east-1"
}

# Simple, without deploy iam role/user
module "serverless_test1" {
  source                  = "../../"
  serverless_service_name = "test1"
  serverless_stage        = "prod"
}

# Deploy iam role
module "serverless_test2" {
  source                    = "../../"
  serverless_service_name   = "test2"
  serverless_stage          = "prod"
  create_deploy_iam_role    = true
  deploy_assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::123456789:oidc-provider/xxxxx.s3.us-east-1.amazonaws.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "xxxxx.s3.us-east-1.amazonaws.com:sub": "system:serviceaccount:namespace:sa"
        }
      }
    }
  ]
}
EOF
}

# Deploy iam suer
module "serverless_test3" {
  source                  = "../../"
  serverless_service_name = "test3"
  serverless_stage        = "prod"
  create_deploy_iam_user  = true
}
