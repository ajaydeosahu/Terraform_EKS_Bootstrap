## AWS LB INGRESS

variable "aws_load_balancer_version" {
  default = ""
  type    = string
}

variable "clusterName" {
  default = ""
  type    = string
}

variable "environment" {
  default = ""
  type    = string
}

variable "ingress_aws_alb_enabled" {
  default = false
  type    = bool
}

variable "provider_url" {
  default = ""
  type    = string
}

variable "region" {
  default = ""
  type    = string
}
