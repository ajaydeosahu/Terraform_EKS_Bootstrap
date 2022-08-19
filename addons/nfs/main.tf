resource "helm_release" "nfs_sc" {
  count      = var.nfs_enabled ? 1 : 0
  name       = "nfs"
  repository = "https://kubernetes-sigs.github.io/nfs-ganesha-server-and-external-provisioner/"
  chart      = "nfs-server-provisioner"
  namespace  = "default"
  timeout    = 600
  version    = "1.4.0"

  values = [
    file("${path.module}/values.yaml")
  ]

  set {
    name  = "persistence.size"
    value = var.nfs_storage_size
  }
}
