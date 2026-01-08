resource "helm_release" "datadog_operator" {
  name       = "datadog-operator"
  namespace  = kubernetes_namespace.workshop.metadata[0].name
  repository = "https://helm.datadoghq.com"
  chart      = "datadog-operator"
  version    = "1.7.0"

  depends_on = [
    kubernetes_namespace.workshop
  ]
}
