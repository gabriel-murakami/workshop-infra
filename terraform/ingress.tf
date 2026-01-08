resource "kubernetes_ingress_v1" "api" {
  metadata {
    name      = "api"
    namespace = kubernetes_namespace.workshop.metadata[0].name

    annotations = {
      "kubernetes.io/ingress.class"                  = "nginx"
      "nginx.ingress.kubernetes.io/auth-url"         = "http://auth-function.workshop.svc.cluster.local/auth/validate"
      "nginx.ingress.kubernetes.io/auth-response-headers" = "X-User"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/api"
          path_type = "Prefix"

          backend {
            service {
              name = "web"
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
