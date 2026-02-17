resource "kubernetes_service" "rabbitmq" {
  metadata {
    name      = "rabbitmq"
    namespace = kubernetes_namespace.workshop.metadata[0].name
  }

  spec {
    selector = {
      app = "rabbitmq"
    }

    port {
      name        = "amqp"
      port        = 5672
      target_port = 5672
    }

    port {
      name        = "management"
      port        = 15672
      target_port = 15672
    }

    type = "ClusterIP"
  }
}
