# CI — LedgerX

CI/CD across Jenkins, GitHub Actions, GitLab, Tekton.
Every pipeline runs the security gates: Trivy, Syft (SBOM), Cosign sign + verify, Snyk, Semgrep, Gitleaks.
Production deploys to ledger / payment-router / settlement use the GitOps two-person rule (PR + co-sign).
