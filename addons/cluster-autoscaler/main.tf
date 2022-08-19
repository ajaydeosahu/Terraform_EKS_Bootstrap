resource "helm_release" "cluster_autoscaler" {
  name       = "cluster-autoscaler"
  repository = "https://kubernetes.github.io/autoscaler"
  chart      = "cluster-autoscaler-chart"
  namespace  = "kube-system"
  version    = var.cluster_autoscaler_version
  timeout    = 600

  values = [
    file("${path.module}/values.yaml")
  ]

  set {
    name  = "autoDiscovery.clusterName"
    value = var.cluster_name
  }

  set {
    name  = "cloudProvider"
    value = "aws"
  }

  set {
    name  = "awsRegion"
    value = var.region
  }
}
