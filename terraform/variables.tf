variable "namespace" {
  type    = string
  default = "workshop"
}

variable "datadog_api_key" {
  type      = string
  sensitive = true
}
