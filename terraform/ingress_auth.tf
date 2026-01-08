resource "kubernetes_ingress_v1" "auth" {
  metadata {
    name      = "auth"
    namespace = kubernetes_namespace.workshop.metadata[0].name

    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
      "nginx.ingress.kubernetes.io/upstream-vhost" = "auth-function.workshop.127.0.0.1.nip.io"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/auth"
          path_type = "Prefix"

          backend {
            service {
              name = "auth-function"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
