resource "kubernetes_ingress_v1" "catalog" {
  metadata {
    name      = "catalog-ingress"
    namespace = kubernetes_namespace.workshop.metadata[0].name

    annotations = {
      "kubernetes.io/ingress.class"                = "nginx"
      "nginx.ingress.kubernetes.io/use-regex"      = "true"
      "nginx.ingress.kubernetes.io/rewrite-target" = "/api/$2"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/api/catalog_service(/|$)(.*)"
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
      }
    }
  }
}
