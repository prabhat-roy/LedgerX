package ledgerx.twoperson

# Production deploys touching the ledger or payment router require two distinct
# approvers. Applied as a GitHub branch protection check + Argo CD pre-sync hook.

money_moving_services = {
  "ledger-service",
  "payment-router",
  "settlement-service",
  "card-issuance",
  "card-authorisation",
  "tokenisation-service",
  "saga-orchestrator",
  "disbursement-service",
  "fx-service",
}

# input.pr.labels = ["env:prod", "service:ledger-service"]
# input.pr.reviews = [{login:"alice", state:"APPROVED"}, ...]

deny[msg] {
  input.pr.target_env == "prod"
  some s
  contains(input.pr.title, money_moving_services[s])
  approvers := { r.login | r := input.pr.reviews; r.state == "APPROVED" }
  count(approvers) < 2
  msg := sprintf("Two-person rule: prod deploy of %v requires 2 distinct approvers, got %v", [s, count(approvers)])
}

# Self-approval is forbidden.
deny[msg] {
  input.pr.target_env == "prod"
  some r
  r := input.pr.reviews[_]
  r.state == "APPROVED"
  r.login == input.pr.author
  msg := sprintf("Self-approval forbidden on prod money-moving deploy by %v", [r.login])
}

# Argo CD pre-sync hook variant — checks the Application annotation for two approver IDs.
deny[msg] {
  input.kind == "Application"
  input.metadata.annotations["ledgerx.io/money-moving"] == "true"
  approvers := split(input.metadata.annotations["ledgerx.io/approvers"], ",")
  count(approvers) < 2
  msg := "Argo Application missing 2 approver IDs in annotation ledgerx.io/approvers"
}
