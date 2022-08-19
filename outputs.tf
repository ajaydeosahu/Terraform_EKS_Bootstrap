output "region" {
  description = "AWS Region for the EKS cluster"
  value       = var.region
}

output "environment" {
  description = "Environment Name for the EKS cluster"
  value       = var.environment
}

output "nginx_ingress_controller_dns_hostname" {
  description = "NGINX Ingress Controller DNS Hostname"
  value       = module.nginx_ingress_controller.nginx_ingress_controller_dns_hostname
}

output "ingress_aws_alb_enabled" {
  description = "Is aws alb ingress is enabled or not?"
  value       = module.aws_load_balancer_controller.ingress_aws_alb_enabled
}

output "ebs_encryption" {
  description = "Is AWS EBS encryption is enabled or not?"
  value       = "Encrypted by default"
}

# output "kms_key_id" {
#   description = "KMS Key ID"
#   value       = join("", aws_kms_key.eks.*.key_id)
# }

# output "cluster_oidc_issuer_url" {
#   description = "The URL on the EKS cluster for the OpenID Connect identity provider"
#   value       = module.eks.cluster_oidc_issuer_url
# }

output "efs_id" {
  value       = module.efs.*.efs_id
  description = "EFS ID"
}
