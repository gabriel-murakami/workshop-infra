resource "kubernetes_ingress_v1" "orders" {
  metadata {
    name      = "orders-ingress"
    namespace = kubernetes_namespace.workshop.metadata[0].name

    annotations = {
      "kubernetes.io/ingress.class"                       = "nginx"
      "nginx.ingress.kubernetes.io/auth-url"              = "http://auth-function.workshop.svc.cluster.local/auth/validate"
      "nginx.ingress.kubernetes.io/auth-response-headers" = "X-User-Id,X-User-CPF"
      "nginx.ingress.kubernetes.io/use-regex"             = "true"
      "nginx.ingress.kubernetes.io/rewrite-target"        = "/api/$2"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/api/order_service(/|$)(.*)"
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
      }
    }
  }
}
