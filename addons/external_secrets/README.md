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
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.43.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.0.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_assume_role_oidc"></a> [iam\_assume\_role\_oidc](#module\_iam\_assume\_role\_oidc) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 3.9.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.secrets_manager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.session_manager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [helm_release.external_secrets](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | n/a | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `""` | no |
| <a name="input_external_secret_enabled"></a> [external\_secret\_enabled](#input\_external\_secret\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `""` | no |
| <a name="input_provider_url"></a> [provider\_url](#input\_provider\_url) | n/a | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->