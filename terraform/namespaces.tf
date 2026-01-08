resource "kubernetes_namespace" "workshop" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_namespace" "knative" {
  metadata {
    name = "knative-serving"
  }
}
