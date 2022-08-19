resource "kubernetes_namespace" "external_secrets" {
  count = var.external_secret_enabled ? 1 : 0

  metadata {
    name = "secrets"
  }
}
module "iam_assume_role_oidc" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "3.9.0"
  create_role                   = var.external_secret_enabled ? true : false
  role_name                     = format("%s-%s-external-secrets-role",var.environment,var.name)
  provider_url                  = var.provider_url
  role_policy_arns              = [join("", aws_iam_policy.secrets_manager_policy.*.arn),join("",aws_iam_policy.session_manager_policy.*.arn)]
}

resource "helm_release" "external_secrets" {
  depends_on = [kubernetes_namespace.external_secrets]
  count      = var.external_secret_enabled ? 1 : 0

  name       = "external-secrets"
  repository = "https://external-secrets.github.io/kubernetes-external-secrets/"
  chart      = "kubernetes-external-secrets"
  namespace  = "secrets"
  timeout    = 600

  values = [
    file("${path.module}/values.yaml")
  ]

  set {
    name  = "env.AWS_REGION"
    value = var.region
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.iam_assume_role_oidc.this_iam_role_arn
  }
}
