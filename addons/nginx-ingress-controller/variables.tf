## NGINX INGRESS

variable "ingress_nginx_enabled" {
  default = false
  type    = bool
}

variable "ingress_nginx_version" {
  default = ""
  type    = string
}
