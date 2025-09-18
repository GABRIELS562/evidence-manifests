# SERVER 2: MONITORING STACK - ACTUAL SETUP
# IP: 192.168.50.74
# User: jaime
# Cost: R0/month (personal hardware)

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "ssh://jaime@192.168.50.74:22"
}

resource "docker_network" "portfolio_net" {
  name   = "portfolio-net"
  driver = "bridge"
}

# Prometheus on port 9090
resource "docker_container" "prometheus" {
  name  = "portfolio-prometheus"
  image = "prom/prometheus:latest"
  
  ports {
    internal = 9090
    external = 9090
  }
  
  volumes {
    host_path      = "/home/jaime/portfolio/monitoring/prometheus/prometheus.yml"
    container_path = "/etc/prometheus/prometheus.yml"
  }
  
  networks_advanced {
    name = docker_network.portfolio_net.name
  }
  
  restart = "unless-stopped"
}

# Loki on port 3100
resource "docker_container" "loki" {
  name  = "portfolio-loki"
  image = "grafana/loki:latest"
  
  ports {
    internal = 3100
    external = 3100
  }
  
  networks_advanced {
    name = docker_network.portfolio_net.name
  }
  
  restart = "unless-stopped"
}

# Grafana on port 3000
resource "docker_container" "grafana" {
  name  = "portfolio-grafana"
  image = "grafana/grafana:latest"
  
  ports {
    internal = 3000
    external = 3000
  }
  
  env = [
    "GF_SECURITY_ADMIN_PASSWORD=admin"
  ]
  
  networks_advanced {
    name = docker_network.portfolio_net.name
  }
  
  restart = "unless-stopped"
}

output "server2_actual" {
  value = {
    stack = {
      prometheus = "http://192.168.50.74:9090"
      loki       = "http://192.168.50.74:3100"
      grafana    = "http://192.168.50.74:3000"
    }
    cost_zar = {
      current = "R0/month"
      aws_managed = "R2,800/month"
      savings = "R33,600/year"
    }
  }
}
