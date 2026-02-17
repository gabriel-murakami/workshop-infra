resource "kubernetes_persistent_volume_claim" "rabbitmq" {
  metadata {
    name      = "rabbitmq-pvc"
    namespace = kubernetes_namespace.workshop.metadata[0].name
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}
