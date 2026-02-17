resource "kubernetes_secret" "rabbitmq" {
  metadata {
    name      = "rabbitmq-secret"
    namespace = kubernetes_namespace.workshop.metadata[0].name
  }

  data = {
    RABBITMQ_DEFAULT_USER = "user"
    RABBITMQ_DEFAULT_PASS = "password"
  }

  type = "Opaque"
}
