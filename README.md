# AKS Platform Foundation

A small, secure-by-default Azure Kubernetes Service foundation written in Terraform: private-network-ready VNet, AKS with workload identity and Azure Policy, a registry with no admin user, central logging, and CI that validates every change.

## Problem
Teams often stand up AKS by clicking through the portal, which leaves no review trail, long-lived credentials and no baseline security. This project codifies a minimal baseline and makes every change go through a pull request.

## What it builds
| Component | Choice | Why |
|---|---|---|
| Network | Dedicated VNet + AKS subnet, Azure CNI | Predictable pod/node addressing, network policy support |
| Cluster | AKS, OIDC issuer + workload identity, Azure Policy add-on, patch auto-upgrade | No pod-level secrets, guardrails, security patches |
| Registry | ACR, admin user disabled, AcrPull to kubelet identity | No shared registry credentials |
| Observability | Log Analytics + Container Insights | Central logs |
| Cluster baseline | Namespace with restricted Pod Security, default-deny NetworkPolicy | Secure starting point for workloads |
| CI | GitHub Actions: fmt, validate, plan via OIDC | No stored cloud secrets |

## Status and evidence
See [docs/STATUS.md](docs/STATUS.md). **Currently: written, not yet deployed.** Nothing is claimed as working until evidence is saved in `docs/evidence/`.

## Known limits
- Single small node pool, Free control-plane tier, not production sized.
- Terraform state is local; remote state backend is a planned improvement.
- No ingress, GitOps or app deployment yet.
- Azure AD / Azure RBAC for cluster access is not enabled yet.

## Run it
```bash
cd infra/terraform
cp terraform.tfvars.example terraform.tfvars   # set your subscription_id
terraform init && terraform plan
# terraform apply   (costs money - destroy when done)
terraform destroy
```

## AI assistance
Scaffolding was drafted with Claude (Anthropic). Design decisions, verification and anything marked "verified" are mine; see [docs/adr](docs/adr).

## License
MIT, (c) Olamide Olalekan. Original work.
