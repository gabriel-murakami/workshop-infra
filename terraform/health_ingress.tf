resource "kubernetes_ingress_v1" "health" {
  metadata {
    name      = "health-ingress"
    namespace = kubernetes_namespace.workshop.metadata[0].name

    annotations = {
      "kubernetes.io/ingress.class"           = "nginx"
      "nginx.ingress.kubernetes.io/use-regex" = "true"
      "nginx.ingress.kubernetes.io/rewrite-target" = "/up"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/catalog_service/up"
          path_type = "ImplementationSpecific"

          backend {
            service {
              name = "catalog-service"
              port {
                number = 3000
              }
            }
          }
        }

        path {
          path      = "/order_service/up"
          path_type = "ImplementationSpecific"

          backend {
            service {
              name = "order-service"
              port {
                number = 3000
              }
            }
          }
        }

        path {
          path      = "/customer_service/up"
          path_type = "ImplementationSpecific"

          backend {
            service {
              name = "customer-service"
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
