<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_efs"></a> [efs](#module\_efs) | cloudposse/efs/aws | 0.31.1 |
| <a name="module_security_group_efs"></a> [security\_group\_efs](#module\_security\_group\_efs) | terraform-aws-modules/security-group/aws | ~> 4 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.efs_eks_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_security_group_rule.cidr_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [null_resource.csi_driver](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.efs_service_account](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.efs_storage_class](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.get_kubeconfig](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_vpc.existing_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [template_file.efs_service_account](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.efs_storage_class](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | Fetch Cluster ID of the cluster | `string` | `""` | no |
| <a name="input_create_efs_security_group"></a> [create\_efs\_security\_group](#input\_create\_efs\_security\_group) | Define if you want to create the security group for EFS | `bool` | `false` | no |
| <a name="input_create_efs_storage_class"></a> [create\_efs\_storage\_class](#input\_create\_efs\_storage\_class) | Set to true if you want to enable the EFS | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment identifier for the EKS cluster | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Specify the name of the EKS cluster | `string` | `""` | no |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | Private subnets of the VPC which can be used by EKS | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region for the EKS cluster | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where the cluster and its nodes will be provisioned | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_efs_id"></a> [efs\_id](#output\_efs\_id) | EFS ID |
<!-- END_TF_DOCS -->