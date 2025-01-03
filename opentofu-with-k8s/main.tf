terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.23.0"
    }
  }
}

provider "kubernetes" {
 config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-second-namespace"
  }
}