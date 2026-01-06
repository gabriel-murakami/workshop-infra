resource "kubectl_manifest" "namespace" {
  yaml_body = file("${path.module}/../k8s/namespace.yaml")
}

resource "kubectl_manifest" "datadog_agent" {
  yaml_body  = file("${path.module}/../k8s/datadog-agent.yaml")
  depends_on = [kubectl_manifest.namespace]
}

resource "kubectl_manifest" "traefik_middlewares" {
  yaml_body = file("${path.module}/../k8s/traefik/middlewares.yaml")

  depends_on = [
    kubectl_manifest.namespace
  ]
}

resource "kubectl_manifest" "traefik_forward_auth" {
  yaml_body = file("${path.module}/../k8s/traefik/forward-auth.yaml")

  depends_on = [
    kubectl_manifest.traefik_middlewares
  ]
}

resource "kubectl_manifest" "traefik_public_route" {
  yaml_body = file("${path.module}/../k8s/traefik/public-route.yaml")

  depends_on = [
    kubectl_manifest.traefik_forward_auth
  ]
}

resource "kubectl_manifest" "traefik_auth_route" {
  yaml_body = file("${path.module}/../k8s/traefik/auth-route.yaml")

  depends_on = [
    kubectl_manifest.traefik_forward_auth
  ]
}

resource "kubectl_manifest" "traefik_api_route" {
  yaml_body = file("${path.module}/../k8s/traefik/api-route.yaml")

  depends_on = [
    kubectl_manifest.traefik_forward_auth
  ]
}
