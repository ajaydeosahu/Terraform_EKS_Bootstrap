resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "metrics-server"
  namespace  = "kube-system"
  version    = var.metrics_server_version
  timeout    = 600

  values = [
    file("${path.module}/values.yaml")
  ]
}
