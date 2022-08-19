resource "kubernetes_namespace" "cert_manager" {
  count = var.cert_manager_enabled ? 1 : 0

  metadata {
    name = "cert-manager"
  }
}

resource "null_resource" "jetstack" {
  depends_on = [kubernetes_namespace.cert_manager]
  count      = var.cert_manager_enabled ? 1 : 0

  provisioner "local-exec" {
    command = "kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v${var.cert_manager_version}/cert-manager.crds.yaml"
  }
}

resource "helm_release" "cert_manager" {
  depends_on = [null_resource.jetstack]
  count      = var.cert_manager_enabled ? 1 : 0

  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = "cert-manager"
  version    = format("%s%s", "v", var.cert_manager_version)
  timeout    = 600

  values = [
    file("${path.module}/values.yaml")
  ]

  set {
    name  = "spec.acme.email"
    value = var.cert_manager_email
  }
}

resource "null_resource" "cluster_issuer" {
  depends_on = [helm_release.cert_manager]
  count      = var.cert_manager_enabled ? 1 : 0

  provisioner "local-exec" {
    command = "kubectl apply -f ${path.module}/prod-issuer.yaml"
  }
}
