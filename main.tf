module "cluster_autoscaler" {
  source = "./addons/cluster-autoscaler"
  # depends_on = [aws_eks_node_group.infra_node]

  region                     = var.region
  cluster_name               = var.cluster_id
  cluster_autoscaler_version = var.cluster_autoscaler_version
}

module "metrics_server" {
  source     = "./addons/metrics-server"
  depends_on = [module.cluster_autoscaler]

  metrics_server_version = var.metrics_server_version
}

module "keda_custom_metric" { //KEDA tool for different custom metric for autoscaling
  source = "./addons/keda"
  depends_on = [module.metrics_server]
  deploy_keda = var.deploy_keda
}

module "nginx_ingress_controller" {
  source     = "./addons/nginx-ingress-controller"
  depends_on = [module.metrics_server]

  ingress_nginx_enabled = var.ingress_nginx_enabled
  ingress_nginx_version = var.ingress_nginx_version
}

module "cert_manager" {
  source     = "./addons/cert-manager"
  depends_on = [module.metrics_server]

  cert_manager_enabled = var.cert_manager_enabled
  cert_manager_version = var.cert_manager_version
  cert_manager_email   = var.cert_manager_email
}

module "aws_load_balancer_controller" {
  source     = "./addons/aws-alb-ingress-controller"
  depends_on = [module.metrics_server]

  ingress_aws_alb_enabled   = var.ingress_aws_alb_enabled
  aws_load_balancer_version = var.aws_load_balancer_version
  environment               = var.environment
  provider_url              = var.provider_url
  clusterName               = var.cluster_id
  region                    = var.region
}

module "external_secrets" {
  source = "./addons/external_secrets"
  # depends_on = [null_resource.get_kubeconfig]

  external_secret_enabled = var.external_secret_enabled
  provider_url            = var.provider_url
  cluster_id              = var.cluster_id
  environment             = var.environment
  region                  = var.region
  name                    = var.name
}

### EFS
module "efs" {
  source = "./addons/efs"

  create_efs_storage_class = var.create_efs_storage_class
  environment = var.environment
  vpc_id      = var.vpc_id
  private_subnet_ids      = var.private_subnet_ids
  region                  = var.region
  name                    = var.name
}

### NFS

module "nfs_sc" {

  source = "./addons/nfs"

  nfs_storage_size = var.nfs_storage_size
}

# resource "helm_release" "nfs_sc" {
#   count      = var.nfs_enabled ? 1 : 0
#   name       = "nfs"
#   repository = "https://kubernetes-sigs.github.io/nfs-ganesha-server-and-external-provisioner/"
#   chart      = "nfs-server-provisioner"
#   namespace  = "default"
#   timeout    = 600
#   version    = "1.4.0"

#   values = [
#     file("${path.module}/addons/nfs/values.yaml")
#   ]

#   set {
#     name  = "persistence.size"
#     value = var.nfs_storage_size
#   }
# }

#Custom storage class

module "storage_class" {
  source = "./addons/storage-class"

  kms_key_id  = var.kms_key_id
}
