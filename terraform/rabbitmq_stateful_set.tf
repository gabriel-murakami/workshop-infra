resource "kubernetes_stateful_set" "rabbitmq" {
  metadata {
    name      = "rabbitmq"
    namespace = kubernetes_namespace.workshop.metadata[0].name
  }

  spec {
    service_name = "rabbitmq"
    replicas     = 1

    selector {
      match_labels = {
        app = "rabbitmq"
      }
    }

    template {
      metadata {
        labels = {
          app = "rabbitmq"
        }
      }

      spec {
        container {
          name  = "rabbitmq"
          image = "rabbitmq:4.1-management"

          port {
            container_port = 5672
          }

          port {
            container_port = 15672
          }

          env_from {
            secret_ref {
              name = kubernetes_secret.rabbitmq.metadata[0].name
            }
          }

          volume_mount {
            name       = "data"
            mount_path = "/var/lib/rabbitmq"
          }
        }

        volume {
          name = "data"

          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.rabbitmq.metadata[0].name
          }
        }
      }
    }
  }
}
