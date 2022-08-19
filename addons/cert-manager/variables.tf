## CERT MANAGER

variable "cert_manager_enabled" {
  default = false
  type    = bool
}

variable "cert_manager_version" {
  default = ""
  type    = string
}

variable "cert_manager_email" {
  default = ""
  type    = string
}