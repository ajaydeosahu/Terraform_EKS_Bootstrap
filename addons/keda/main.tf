resource "null_resource" "keda_custom_metric" { //KEDA tool for different custom metric for autoscaling
  count      = var.deploy_keda ? 1 : 0
  provisioner "local-exec" {
    command = "kubectl apply -f ${path.module}/keda.yaml"
  }
}
