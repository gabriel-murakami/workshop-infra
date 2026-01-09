resource "kubernetes_ingress_v1" "public" {
  metadata {
    name      = "public"
    namespace = kubernetes_namespace.workshop.metadata[0].name

    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/"
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
