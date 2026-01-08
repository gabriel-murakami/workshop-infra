resource "kubernetes_ingress_v1" "api" {
  metadata {
    name      = "api"
    namespace = kubernetes_namespace.workshop.metadata[0].name

    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
      "nginx.ingress.kubernetes.io/auth-url" = "http://auth-function.workshop.127.0.0.1.nip.io/auth/validate"
      "nginx.ingress.kubernetes.io/auth-response-headers" = "X-User-Id,X-User-CPF"
      "nginx.ingress.kubernetes.io/proxy-connect-timeout" = "10"
      "nginx.ingress.kubernetes.io/proxy-read-timeout"    = "10"
      "nginx.ingress.kubernetes.io/proxy-send-timeout"    = "10"
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
              name = "web-service"
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
