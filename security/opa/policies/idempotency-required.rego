package ledgerx.idempotency

# Reject any monetary write that does not carry an Idempotency-Key.
# Applies to: ledger-service.PostJournal, transaction-service.Authorise/Post,
# payment-gateway.InitiatePayment, payment-router.Route, lending.Disburse,
# treasury.fx.Book, cards.Issue, etc.

deny[msg] {
  input.kind == "AdmissionReview"  # K8s admission webhook for HTTP CRD
  input.request.resource.resource == "envoyfilters"
  not has_idempotency_filter
  msg := "Money-moving Envoy route MUST include an Idempotency-Key validation filter."
}

# Envoy ext_authz / Conduktor policy variant: reject the inbound request itself.
deny[msg] {
  input.context == "envoy.ext_authz"
  startswith(input.attributes.request.http.path, "/ledger.v1/")
  not input.attributes.request.http.headers["idempotency-key"]
  msg := sprintf("Missing Idempotency-Key on %v", [input.attributes.request.http.path])
}

deny[msg] {
  input.context == "envoy.ext_authz"
  startswith(input.attributes.request.http.path, "/payments.v1/")
  not input.attributes.request.http.headers["idempotency-key"]
  msg := sprintf("Missing Idempotency-Key on %v", [input.attributes.request.http.path])
}

deny[msg] {
  input.context == "envoy.ext_authz"
  startswith(input.attributes.request.http.path, "/cards.v1/")
  input.attributes.request.http.method == "POST"
  not input.attributes.request.http.headers["idempotency-key"]
  msg := sprintf("Missing Idempotency-Key on %v", [input.attributes.request.http.path])
}

has_idempotency_filter {
  some f
  input.request.object.spec.configPatches[f].patch.value.name == "envoy.filters.http.idempotency"
}
