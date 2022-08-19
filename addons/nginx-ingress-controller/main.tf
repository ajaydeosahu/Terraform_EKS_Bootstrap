resource "kubernetes_namespace" "ingress_nginx" {
  count = var.ingress_nginx_enabled ? 1 : 0

  metadata {
    name = "ingress-nginx"
  }
}

resource "helm_release" "ingress_nginx_controller" {
  depends_on = [kubernetes_namespace.ingress_nginx]
  count      = var.ingress_nginx_enabled ? 1 : 0

  name       = "ingress-nginx-controller"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  version    = var.ingress_nginx_version
  timeout    = 600

  values = [
    file("${path.module}/values.yaml")
  ]
}

data "kubernetes_service" "get_ingress_nginx_controller_svc" {
  depends_on = [helm_release.ingress_nginx_controller]
  count      = var.ingress_nginx_enabled ? 1 : 0

  metadata {
    name      = "ingress-nginx-controller-controller"
    namespace = "ingress-nginx"
  }
}
