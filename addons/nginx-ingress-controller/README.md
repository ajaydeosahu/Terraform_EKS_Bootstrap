<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.43.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.0.2 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.0.2 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.ingress_nginx_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.ingress_nginx](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_service.get_ingress_nginx_controller_svc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ingress_nginx_enabled"></a> [ingress\_nginx\_enabled](#input\_ingress\_nginx\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_ingress_nginx_version"></a> [ingress\_nginx\_version](#input\_ingress\_nginx\_version) | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nginx_ingress_controller_dns_hostname"></a> [nginx\_ingress\_controller\_dns\_hostname](#output\_nginx\_ingress\_controller\_dns\_hostname) | NGINX Ingress Controller DNS Hostname |
<!-- END_TF_DOCS -->