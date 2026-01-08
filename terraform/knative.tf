resource "kubernetes_config_map" "knative_domain" {
  metadata {
    name      = "config-domain"
    namespace = kubernetes_namespace.knative.metadata[0].name
  }

  data = {
    "127.0.0.1.nip.io" = ""
  }
}
