resource "kubernetes_secret" "datadog" {
  metadata {
    name      = "datadog-secret"
    namespace = kubernetes_namespace.workshop.metadata[0].name
  }

  data = {
    api-key = base64encode(var.datadog_api_key)
  }

  type = "Opaque"
}
