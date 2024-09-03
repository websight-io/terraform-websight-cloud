# WebSight IaC based on Helm [Chart](https://github.com/websight-io/charts/tree/main/websight-cms)
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.8.1 |
| helm | ~> 2.12.0 |
| kubernetes | ~> 2.29.0 |

## Providers

| Name | Version |
|------|---------|
| helm | 2.12.1 |
| kubernetes | 2.29.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.websight_cms](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_secret.websight_cms_secrets](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_values | Additional WebSight chart release values. Values provided via this variable are used together with default values defined in script during release. | `list(string)` | `[]` | no |
| admin\_login | WebSight admin user login | `string` | `"sxadmin"` | no |
| admin\_password | WebSight admin user password | `string` | n/a | yes |
| custom\_values | Custom WebSight chart release values. Values provided via this variable are used without default values defined in script during release. | `list(string)` | `[]` | no |
| namespace | K8s namespace in which WebSight is installed | `string` | n/a | yes |
| secrets | Secrets passed to WebSight container as ENV variables via secret mount | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| cms\_service\_name | WebSight CMS K8s service name |
| cms\_service\_port | WebSight CMS K8s service port |
<!-- END_TF_DOCS -->