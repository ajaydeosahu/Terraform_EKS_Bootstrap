data "template_file" "aws_custom_storage_class" {
  template   = file("${path.module}/aws-custom-storage-class.yaml")

  vars = {
    encrypted = true
    kmskeyId  = var.kms_key_id
  }
}

resource "null_resource" "aws_custom_storage_class" {
  depends_on = [data.template_file.aws_custom_storage_class]

  provisioner "local-exec" {
    command = "kubectl apply -f -<<EOF\n${join("", data.template_file.aws_custom_storage_class.*.rendered)}\nEOF"
  }
}
