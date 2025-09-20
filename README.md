ACTUAL COMPLIANCE SCORES FROM YOUR SYSTEM:

SOX: 78.0% (not 76.8%)
FDA: 92.0% (correct)
GMP: 94.0% (correct)
Evidence blocks: 47 blocks (correct)

ACTUAL AWS COSTS:
Let me recalculate realistic AWS equivalents for South African market:
markdown# evidence-manifests

**Digital Evidence Pipeline - Infrastructure as Code**

> *Forensic-Grade DevOps Infrastructure by Jaime Gabriels*

## 🏗️ **Architecture Overview**

This repository contains the complete Infrastructure as Code (IaC) for a forensic-grade DevOps pipeline built by a DNA forensic scientist. The infrastructure demonstrates laboratory-grade compliance monitoring across a 3-server hybrid cloud architecture.

## 📊 **Current Infrastructure**

### **Server 1: K3s Production Cluster**
- **IP**: `100.89.26.128` (Tailscale mesh)
- **Role**: Kubernetes production workloads
- **Apps**: LIMS (port 30007), Finance (30002), Pharma (30008)
- **Cost**: R0/month (personal hardware)

### **Server 2: Monitoring Stack** 
- **IP**: `192.168.50.74` (Local network)
- **Role**: Observability and metrics collection
- **Stack**: Prometheus (9090), Grafana (3000), Loki (3100)
- **Cost**: R0/month (personal hardware)

### **EC2: Forensic Analysis Engine**
- **IP**: `100.101.99.93` (AWS Free Tier)
- **Role**: Evidence collection and compliance scoring
- **Services**: Evidence API (8888), Compliance Dashboard (9999)
- **Cost**: R0/month (Free Tier)

## 🔬 **Live Compliance Monitoring**

Real-time compliance scoring from actual infrastructure monitoring:
```json
{
  "current_compliance": {
    "SOX_404": "78.0%",
    "FDA_21_CFR_11": "92.0%", 
    "GMP_Guidelines": "94.0%"
  },
  "evidence_chain_blocks": 47,
  "finance_anomalies": 32,
  "pharma_violations": 0,
  "audit_trail_integrity": "100%"
}
💰 Cost Analysis (ZAR)
ComponentCurrent (Home Lab)AWS EquivalentAnnual SavingsK3s ClusterR0R30,000R30,000Monitoring StackR0R18,000R18,000Forensic EngineR0R4,800R4,800TotalR0R52,800R52,800
🎯 Key Differentiators
Forensic Heritage

Chain of Custody: Every deployment tracked with immutable audit trail
Evidence Integrity: Cryptographic verification of all system changes
Compliance Automation: Real-time scoring against FDA, SOX, GMP standards
Laboratory Workflows: Purpose-built LIMS with forensic-grade data handling

Technical Excellence

Live Infrastructure: All systems accessible and running 24/7
Hybrid Architecture: On-premise efficiency with cloud forensic engine
GitOps Deployment: ArgoCD for declarative infrastructure management
Multi-Environment: Dev/Staging/Production separation

🚀 Technologies Used
Infrastructure: Kubernetes (K3s), Docker, Terraform, AWS EC2
Monitoring: Prometheus, Grafana, Loki, AlertManager
CI/CD: Jenkins, ArgoCD, GitHub Actions
Networking: Tailscale mesh, Cloudflare tunnels
Compliance: Custom forensic analysis engine
🔐 Security & Compliance

Zero Trust Architecture: Tailscale mesh networking
Immutable Infrastructure: GitOps-managed deployments
Forensic Logging: Chain-of-custody for all system events
Multi-Factor Authentication: Required for all admin access
Encrypted Transit: TLS everywhere, zero cleartext communication

📁 Repository Structure
evidence-manifests/
├── terraform/
│   ├── server1-k3s/         # K3s cluster configuration
│   ├── server2-monitoring/  # Docker monitoring stack  
│   ├── ec2-forensic/        # AWS forensic engine
│   └── aws-ideal/           # Production cloud architecture
├── manifests/
│   ├── applications/        # K8s application deployments
│   ├── monitoring/          # Observability stack
│   └── forensic/           # Evidence collection services
└── docs/
    ├── compliance/          # Regulatory documentation
    └── architecture/        # System design documents
🎓 Professional Background
Jaime Gabriels - Forensic DevOps Engineer

DNA forensic analysis experience
AWS Solutions Architect Associate
Terraform Associate Certified
Kubernetes Administrator (CKA in progress)
Masters in Business Leadership
BSc Biotechnology

🌍 Live Demonstrations

LIMS: https://lims.jagdevops.co.za
Finance Dashboard: https://finance.jagdevops.co.za
Pharma Pipeline: https://pharma.jagdevops.co.za
Monitoring: http://192.168.50.74:3000
Forensic Engine: http://100.101.99.93:9999

🚀 Getting Started
bash# Clone repository
git clone https://github.com/GABRIELS562/evidence-manifests.git
cd evidence-manifests

# Review Terraform configurations
cd terraform && ls -la

# Examine current infrastructure
terraform plan

"In forensics, contamination means a criminal walks free. In DevOps, it means production goes down. Neither is acceptable."
Bringing forensic precision to modern cloud infrastructure.
