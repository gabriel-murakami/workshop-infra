resource "kubectl_manifest" "namespace" {
  yaml_body = file("${path.module}/../k8s/namespace.yaml")
}

resource "kubectl_manifest" "datadog_agent" {
  yaml_body  = file("${path.module}/../k8s/datadog-agent.yaml")
  depends_on = [kubectl_manifest.namespace]
}
