resource "kubernetes_ingress_v1" "webhook" {
  metadata {
    name      = "webhook"
    namespace = kubernetes_namespace.workshop.metadata[0].name

    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/webhooks/payments"
          path_type = "Prefix"

          backend {
            service {
              name = "order-service"
              port {
                number = 3000
              }
            }
          }
        }
      }
    }
  }
}
