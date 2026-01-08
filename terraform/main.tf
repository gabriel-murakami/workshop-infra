resource "kubectl_manifest" "datadog_agent" {
  yaml_body = file("${path.module}/../k8s/datadog-agent.yaml")
}
