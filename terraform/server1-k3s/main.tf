# SERVER 1: K3S PRODUCTION CLUSTER - ACTUAL SETUP
# IP: 100.89.26.128
# Cost: R0/month (personal hardware)
# AWS Equivalent: R4,200/month (3-node EKS)

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  host        = "https://100.89.26.128:6443"
}

resource "kubernetes_namespace" "production" {
  metadata {
    name = "production"
  }
}

# LIMS App on port 30007
resource "kubernetes_deployment" "lims_app" {
  metadata {
    name      = "lims-app"
    namespace = "production"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "lims-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "lims-app"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name  = "lims"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "lims_service" {
  metadata {
    name      = "lims-app"
    namespace = "production"
  }
  spec {
    type = "LoadBalancer"
    port {
      port        = 80
      node_port   = 30007
    }
    selector = {
      app = "lims-app"
    }
  }
}

# Finance App on port 30002
resource "kubernetes_deployment" "finance_app" {
  metadata {
    name      = "finance-app"
    namespace = "production"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "finance-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "finance-app"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name  = "finance"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "finance_service" {
  metadata {
    name      = "finance-app"
    namespace = "production"
  }
  spec {
    type = "LoadBalancer"
    port {
      port        = 80
      node_port   = 30002
    }
    selector = {
      app = "finance-app"
    }
  }
}

# Pharma App on port 30003
resource "kubernetes_deployment" "pharma_app" {
  metadata {
    name      = "pharma-app"
    namespace = "production"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "pharma-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "pharma-app"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name  = "pharma"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "pharma_service" {
  metadata {
    name      = "pharma-app"
    namespace = "production"
  }
  spec {
    type = "LoadBalancer"
    port {
      port        = 80
      node_port   = 30003
    }
    selector = {
      app = "pharma-app"
    }
  }
}

output "server1_actual" {
  value = {
    apps = {
      lims    = "http://100.89.26.128:30007"
      finance = "http://100.89.26.128:30002"
      pharma  = "http://100.89.26.128:30003"
    }
    cost_zar = {
      current = "R0/month"
      aws_eks = "R4,200/month"
      savings = "R50,400/year"
    }
  }
}
