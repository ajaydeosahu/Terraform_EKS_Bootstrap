module "iam_assume_role_oidc" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "3.9.0"
  create_role                   = var.ingress_aws_alb_enabled ? true : false
  role_name                     = "aws-ingress-service-account-role"
  provider_url                  = var.provider_url
  role_policy_arns              = [join("", aws_iam_policy.alb_ingress_policy.*.arn)]
  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:aws-load-balancer-controller"]
}

resource "null_resource" "aws_load_balancer_controller" {
  depends_on = [module.iam_assume_role_oidc]
  count      = var.ingress_aws_alb_enabled ? 1 : 0

  provisioner "local-exec" {
    command = "kubectl apply -k 'github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master'"
  }
}

resource "helm_release" "aws_load_balancer_controller" {
  depends_on = [null_resource.aws_load_balancer_controller]
  count      = var.ingress_aws_alb_enabled ? 1 : 0

  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  version    = var.aws_load_balancer_version
  timeout    = 600

  values = [
    file("${path.module}/values.yaml")
  ]

  set {
    name  = "clusterName"
    value = var.clusterName
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.iam_assume_role_oidc.this_iam_role_arn
  }

  set {
    name  = "region"
    value = var.region
  }
}
