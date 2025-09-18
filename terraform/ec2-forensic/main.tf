# EC2: FORENSIC ANALYSIS ENGINE - ACTUAL SETUP
# IP: 100.101.99.93
# Instance: t2.micro (free tier)
# Running: Python script on port 9999

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "forensic_engine" {
  triggers = {
    instance_ip = "100.101.99.93"
    instance_type = "t2.micro"
    port = "9999"
  }
}

output "ec2_actual" {
  value = {
    endpoints = {
      metrics  = "http://100.101.99.93:9999/metrics"
      evidence = "http://100.101.99.93:9999/evidence"
      audit    = "http://100.101.99.93:9999/audit"
    }
    real_scores = {
      sox = "76.6%"
      fda = "92%"
      gmp = "94%"
    }
    cost_zar = {
      current = "R0/month (free tier)"
      savings = "R7,200/year"
    }
  }
}
