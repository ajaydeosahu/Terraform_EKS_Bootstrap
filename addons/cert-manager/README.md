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
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.cert_manager](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [null_resource.cluster_issuer](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.jetstack](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_manager_email"></a> [cert\_manager\_email](#input\_cert\_manager\_email) | n/a | `string` | `""` | no |
| <a name="input_cert_manager_enabled"></a> [cert\_manager\_enabled](#input\_cert\_manager\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_cert_manager_version"></a> [cert\_manager\_version](#input\_cert\_manager\_version) | n/a | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->