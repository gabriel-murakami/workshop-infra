# resource "kubernetes_secret" "datadog" {
#   metadata {
#     name      = "datadog-secret"
#     namespace = "workshop"
#   }

#   data = {
#     api-key = var.datadog_api_key
#   }

#   type = "Opaque"
# }
