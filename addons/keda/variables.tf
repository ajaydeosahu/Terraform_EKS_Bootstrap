variable "deploy_keda" {
  description = "Set to true if you want to deploy keda to EKS cluster"
  default     = false
  type        = bool
}