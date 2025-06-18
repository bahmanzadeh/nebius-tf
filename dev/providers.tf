terraform {
  required_version = ">= 1.4.0"
  required_providers {
    nebius = {
      source  = "nebius-cloud/nebius"
      version = ">= 0.83.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.11.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.24.0"
    }
  }
}

provider "nebius" {}
provider "helm" {}
provider "kubernetes" {}
