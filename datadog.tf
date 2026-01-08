# resource "helm_release" "datadog" {
#   name       = "datadog"
#   namespace  = kubernetes_namespace.workshop.metadata[0].name
#   repository = "https://helm.datadoghq.com"
#   chart      = "datadog"
#   version    = "3.60.0"

#   set {
#     name  = "datadog.site"
#     value = "datadoghq.com"
#   }

#   set {
#     name  = "datadog.clusterName"
#     value = "workshop-cluster"
#   }

#   set {
#     name  = "datadog.apiKeyExistingSecret"
#     value = "datadog-secret"
#   }

#   set {
#     name  = "datadog.logs.enabled"
#     value = "true"
#   }

#   set {
#     name  = "datadog.logs.containerCollectAll"
#     value = "true"
#   }

#   set {
#     name  = "datadog.containerRuntime"
#     value = "docker"
#   }

#   set {
#     name  = "datadog.dockerSocketPath"
#     value = "/var/run/docker.sock"
#   }

#   set {
#     name  = "agents.volumes[0].name"
#     value = "dockersocket"
#   }

#   set {
#     name  = "agents.volumes[0].hostPath.path"
#     value = "/var/run/docker.sock"
#   }

#   set {
#     name  = "agents.volumeMounts[0].name"
#     value = "dockersocket"
#   }

#   set {
#     name  = "agents.volumeMounts[0].mountPath"
#     value = "/var/run/docker.sock"
#   }

#   set {
#     name  = "datadog.apm.enabled"
#     value = "true"
#   }

#   set {
#     name  = "datadog.apm.portEnabled"
#     value = "true"
#   }

#   set {
#     name  = "datadog.clusterAgent.enabled"
#     value = "true"
#   }

#   set {
#     name  = "datadog.clusterChecks.enabled"
#     value = "false"
#   }

#   set {
#     name  = "datadog.processAgent.enabled"
#     value = "false"
#   }

#   set {
#     name  = "datadog.systemProbe.enabled"
#     value = "false"
#   }
# }
