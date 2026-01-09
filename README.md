# workshop-infra

## Visão Geral

Este repositório é responsável por **provisionar a infraestrutura compartilhada do cluster Kubernetes** utilizado no projeto **Projeto Tech Challenge – Arquitetura de Software**.
Ele contém toda a base necessária para que as aplicações funcionem corretamente, incluindo:
- Ingress Controller
- API Gateway
- Observabilidade
- Integração com autenticação serverless

Toda a infraestrutura é criada via **Terraform**, utilizando **Minikube** como cluster Kubernetes local.

---

## Responsabilidades

- Provisionar o cluster Kubernetes (Minikube)
- Instalar e configurar o NGINX Ingress Controller
- Configurar rotas de entrada da aplicação (`/auth`, `/auth/validate`, `/api`)
- Instalar e configurar o Datadog Agent via Helm
- Centralizar observabilidade (APM, métricas e logs)
- Servir como ponto único de entrada para as aplicações

---

## Componentes Provisionados

- Kubernetes Namespace
- NGINX Ingress Controller
- Ingress Rules
- Datadog Agent (via k8s)
- Configurações globais de rede e observabilidade

---

## Rotas de Entrada

| Rota             | Destino                 | Descrição |
|------------------|-------------------------|-----------|
| `/auth`          | auth-function (Knative) | Geração de token JWT |
| `/auth/validate` | auth-function (Knative) | Validação de token (auth_request) |
| `/api/*`         | Rails API (workshop)    | API principal da aplicação |

---

## Tecnologias Utilizadas

- Terraform
- Kubernetes
- Minikube
- Helm
- NGINX Ingress Controller
- Datadog

---

## Pré-requisitos

- Docker
- Minikube
- kubectl
- Terraform
- Helm

---

## Como Aplicar a Infraestrutura

```bash
terraform init
terraform plan
terraform apply
```
