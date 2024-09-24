locals {
  secrets          = merge(
    {
      "WS_ADMIN_USERNAME" : var.admin_login
      "WS_ADMIN_PASSWORD" : var.admin_password
    },
    var.secrets
  )
}

resource "kubernetes_secret" "websight_cms_secrets" {
  metadata {
    name      = "websight-cms-websight-cms-secrets"
    namespace = var.namespace
  }

  data = local.secrets
}

resource "helm_release" "websight_cms" {
  name       = "websight-cms"
  repository = "https://websight-io.github.io/charts"
  chart      = "websight-cms"
  version    = "2.2.1"
  namespace  = var.namespace
  timeout    = 600

  values = length(var.custom_values) > 0 ? var.custom_values : concat(
    [file("${path.module}/values.yaml")],
    var.additional_values
  )
}