#!/usr/bin/env bash
# One-shot deploy of every OSS tool registered for LedgerX via ArgoCD.
set -euo pipefail
argocd app sync -l "project=ledgerx-tools" --grpc-web
