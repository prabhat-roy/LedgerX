# GitOps — LedgerX

Argo CD app-of-apps + Argo Rollouts (blue-green for ledger / payment-router / settlement,
canary for everything else). Argo Workflows runs the GitOps build pipelines.

## Two-person rule
Production deploys touching `ledger-service`, `payment-router`, `settlement-service`,
or any service labelled `ledgerx.io/money-moving=true` require:
1. PR raised against `gitops-prod` repo.
2. Two distinct reviewers approve (CODEOWNERS-enforced).
3. `autoPromotionEnabled: false` on the matching `Rollout` — promotion requires
   manual `kubectl argo rollouts promote` from a second operator.

## Layout
```
gitops/
  argocd/
    app-of-apps.yaml
    projects/ledgerx.yaml
    applicationsets/{ledgerx-aws,ledgerx-gcp,ledgerx-azure}.yaml
  argo-rollouts/
    analysis-template.yaml
    rollouts/<service>-rollout.yaml
  argo-workflows/ci-build.yaml
  argo-events/eventsources/github.yaml + sensors/ci-trigger.yaml
  flux/ledgerx-source.yaml + ledgerx-helmreleases.yaml
```
