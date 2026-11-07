# ADR-001: Terraform for infrastructure

Status: Draft - rewrite in your own words after you decide.

## Context
Azure offers Bicep (Azure-only) and Terraform (multi-cloud).

## Decision
Terraform, because it matches my existing AWS/GCP work (EKS, GKE) and shows the same concepts across clouds.

## Consequences
Need a remote state backend later; azurerm provider versions must be pinned.
