locals {
  trusted_role_arns = distinct(
    compact(
      concat(
        [data.aws_caller_identity.current.account_id],
        var.trusted_role_arns,
      ),
    ),
  )
}
