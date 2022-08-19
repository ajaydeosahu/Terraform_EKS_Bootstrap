## COMMON VARIABLES

variable "additional_tags" {
  description = "Tags for resources"
  type        = map(string)
  default = {
  }
}

variable "cert_manager_enabled" {
  description = "Set true to enable the cert manager for eks"
  default     = false
  type        = bool
}

variable "cert_manager_version" {
  description = "Specify the version of the cert manager for eks"
  default     = ""
  type        = string
}

variable "cluster_autoscaler_version" {
  description = "Mention the version of the cluster autoscaler"
  default     = ""
  type        = string
}

variable "cluster_iam_role_name" {
  description = "Fetch IAM Role of the cluster"
  default     = ""
  type        = string
}

variable "worker_iam_role_name" {
  description = "Fetch IAM Role of worker nodes in the cluster"
  default     = ""
  type        = string
}

variable "cluster_id" {
  description = "Fetch Cluster ID of the cluster"
  default     = "prod-mysql-skaf-mysql"
  type        = string
}

variable "provider_url" {
  description = "Provider URL"
  default     = ""
  type        = string
}

variable "create_efs_storage_class" {
  description = "Set to true if you want to enable the EFS"
  default     = false
  type        = bool
}

variable "create_efs_security_group" {
  description = "Define if you want to create the security group for EFS"
  default = false
  type    = bool
}

variable "deploy_keda" {
  description = "Set to true if you want to deploy keda to EKS cluster"
  default     = false
  type        = bool
}
variable "environment" {
  description = "Environment identifier for the EKS cluster"
  default     = ""
  type        = string
}

variable "external_secret_enabled" {
  description = "Set true if you want to enable the external secret"
  default     = true
  type        = bool
}

variable "image_high_threshold_percent" {
  default = 60
  type    = number
}

variable "image_low_threshold_percent" {
  default = 40
  type    = number
}

variable "ingress_aws_alb_enabled" {
  description = "Specify if you want to enable the AWS ALB for ingress"
  default     = false
  type        = bool
}

variable "ingress_nginx_enabled" {
  description = "Set true if you want the nginx ingress enabled"
  default     = false
  type        = bool
}

variable "aws_load_balancer_version" {
  description = "load balancer version for ingress"
  default     = ""
  type        = string
}

variable "ingress_nginx_version" {
  description = "Specify the version of the nginx ingress"
  default     = ""
  type        = string
}

variable "metrics_server_version" {
  description = "Specify the metrics server version for EKS cluster"
  default     = ""
  type        = string
}

variable "name" {
  description = "Specify the name of the EKS cluster"
  default     = ""
  type        = string
}

variable "region" {
  description = "AWS region for the EKS cluster"
  default     = ""
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the cluster and its nodes will be provisioned"
  default     = ""
  type        = string
}
variable "private_subnet_ids" {
  description = "Private subnets of the VPC which can be used by EFS"
  default = [""]
  type    = list(string)
}

variable "Warning" {
  default = "Warning!! !SAVE THIS PEM FILE FOR ACCESSING WORKER NODES !"
  type    = string
}

## NFS 

variable "nfs_storage_size" {
  default = "10Gi"
  type    = string
}

variable "nfs_enabled" {
  default = false
  type    = bool
}

variable "name_ssm_parameter" {
  default = null
  type    = string
}

variable "cert_manager_email" {
  default     = ""
  type        = string
  description = "Enter cert manager email"
}


#KMS

variable "kms_key_id" {
  type = string
  default = ""
  description = "KMS key to Encrypt AWS resources"
}
