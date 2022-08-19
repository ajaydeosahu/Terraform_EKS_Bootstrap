variable "cluster_id" {
   default = ""
   type    = string
  
}

variable "environment" {
    default = ""
    type = string   
}

variable "external_secret_enabled" {
    default = false
    type    = bool  
}

variable "name" {
  default = ""
  type    = string
}

variable "provider_url" {
  default = ""
  type    = string
}

variable "region" {
  default = ""
  type    = string
}
