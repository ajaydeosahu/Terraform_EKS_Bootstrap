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
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_assume_role_oidc"></a> [iam\_assume\_role\_oidc](#module\_iam\_assume\_role\_oidc) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 3.9.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.alb_ingress_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [helm_release.aws_load_balancer_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [null_resource.aws_load_balancer_controller](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_load_balancer_version"></a> [aws\_load\_balancer\_version](#input\_aws\_load\_balancer\_version) | n/a | `string` | `""` | no |
| <a name="input_clusterName"></a> [clusterName](#input\_clusterName) | n/a | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `""` | no |
| <a name="input_ingress_aws_alb_enabled"></a> [ingress\_aws\_alb\_enabled](#input\_ingress\_aws\_alb\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_provider_url"></a> [provider\_url](#input\_provider\_url) | n/a | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ingress_aws_alb_enabled"></a> [ingress\_aws\_alb\_enabled](#output\_ingress\_aws\_alb\_enabled) | Is aws alb ingress is enabled or not? |
<!-- END_TF_DOCS -->