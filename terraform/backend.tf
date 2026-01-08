terraform {
  backend "local" {
    path = "/opt/terraform-state/workshop-infra/terraform.tfstate"
  }
}
