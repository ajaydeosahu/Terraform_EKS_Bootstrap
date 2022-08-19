resource "null_resource" "csi_driver" {
  count                  = var.create_efs_storage_class ? 1 : 0
  provisioner "local-exec" {
    command = "kubectl apply -f ${path.module}/csi_driver.yaml"
  }
}

data "aws_vpc" "existing_vpc" {
  id = var.vpc_id
}
module "efs" {
  source                 = "cloudposse/efs/aws"
  version                = "0.31.1"
  count                  = var.create_efs_storage_class ? 1 : 0
  name                   = format("%s-%s-efs", var.environment, var.name)
  region                 = var.region
  vpc_id                 = var.vpc_id
  subnets                = var.private_subnet_ids
  security_group_enabled = false
  security_groups        = split(",", module.security_group_efs.security_group_id)
}
resource "aws_security_group_rule" "cidr_ingress" {
  count             = var.create_efs_storage_class ? 1 : 0
  description       = "From allowed CIDRs"
  type              = "ingress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.existing_vpc.cidr_block]
  security_group_id = module.security_group_efs.security_group_id
}
module "security_group_efs" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "~> 4"
  create      = var.create_efs_storage_class
  name        = format("%s-%s-%s", var.environment, var.name, "efs-sg")
  description = "Complete PostgreSQL example security group"
  vpc_id      = var.vpc_id
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  tags = tomap(
    {
      "Name"        = format("%s-%s-%s", var.environment, var.name, "efs-sg")
      "Environment" = var.environment
    },
  )
}
resource "aws_iam_policy" "efs_eks_policy" {
  #depends_on  = [aws_efs_file_system.efs_mount_on_eks]
  count       = var.create_efs_storage_class ? 1 : 0
  name        = format("%s-%s-efs-policy", var.environment, var.name)
  description = "EFS policy for EKS Cluster"
  path        = "/"
  policy      = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "elasticfilesystem:DescribeAccessPoints",
                "elasticfilesystem:DescribeFileSystems"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "elasticfilesystem:CreateAccessPoint"
            ],
            "Resource": "*",
            "Condition": {
                "StringLike": {
                    "aws:RequestTag/efs.csi.aws.com/cluster": "true"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": "elasticfilesystem:DeleteAccessPoint",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:ResourceTag/efs.csi.aws.com/cluster": "true"
                }
            }
        }
    ]
}
EOT
}
data "template_file" "efs_storage_class" {
  depends_on = [module.efs]
  template   = file("${path.module}/efs_storage_class.yaml")
  count      = var.create_efs_storage_class ? 1 : 0
  vars = {
    fileSystemId = join("", module.efs.*.id)
  }
}
resource "null_resource" "efs_storage_class" {
  depends_on = [module.efs]
  count      = var.create_efs_storage_class ? 1 : 0
  provisioner "local-exec" {
    command = "kubectl apply -f -<<EOF\n${join("", data.template_file.efs_storage_class.*.rendered)}\nEOF"
  }
}
data "template_file" "efs_service_account" {
  depends_on = [module.efs]
  template   = file("${path.module}/efs_service_account.yaml")
  count      = var.create_efs_storage_class ? 1 : 0
  vars = {
    efs_iam_role = join("", aws_iam_policy.efs_eks_policy.*.arn)
  }
}
resource "null_resource" "efs_service_account" {
  depends_on = [module.efs]
  count      = var.create_efs_storage_class ? 1 : 0
  provisioner "local-exec" {
    command = "kubectl apply -f -<<EOF\n${join("", data.template_file.efs_service_account.*.rendered)}\nEOF"
  }
}
