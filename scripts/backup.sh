#!/usr/bin/env bash
set -euo pipefail
NS="${1:-ledgerx}"
TS=$(date -u +%Y%m%dT%H%M%S)
velero backup create "ledgerx-$TS" --include-namespaces "$NS" --wait
