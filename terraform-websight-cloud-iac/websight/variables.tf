variable "namespace" {
  description = "K8s namespace in which WebSight is installed"
  type = string
}

variable "additional_values" {
  description = "Additional WebSight chart release values. Values provided via this variable are used together with default values defined in script during release."
  type = list(string)
  default = []
}

variable "custom_values" {
  description = "Custom WebSight chart release values. Values provided via this variable are used without default values defined in script during release."
  type = list(string)
  default = []
}

variable "admin_login" {
  description = "WebSight admin user login"
  type = string
  default = "sxadmin"
  sensitive = true
}

variable "admin_password" {
  description = "WebSight admin user password"
  type = string
  sensitive = true
}

variable "secrets" {
  description = "Secrets passed to WebSight container as ENV variables via secret mount"
  type = map(string)
  default = {}
}