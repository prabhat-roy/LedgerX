package ledgerx.carddata

# PCI-DSS: raw PAN must never leave the cards-cde namespace.
# This policy is loaded into:
#   1. Conduktor Gateway — to reject Kafka messages that contain a 13-19 digit PAN-like string
#      anywhere outside CardRef.token.
#   2. Envoy ext_authz on every egress out of cards-cde namespace.
#   3. Vault PKI — to gate detokenise() requests.

pan_pattern := `[0-9]{13,19}`

# Kafka produce path — Conduktor injects message bytes into input.message.
deny[msg] {
  input.context == "conduktor.produce"
  input.topic != "cards.tokenisation.detokenised"   # the only allowed PAN-bearing topic
  contains_pan(input.message)
  msg := sprintf("PAN detected in message produced to topic %v", [input.topic])
}

# HTTP egress from cards-cde namespace.
deny[msg] {
  input.context == "envoy.ext_authz"
  input.attributes.source.namespace == "cards-cde"
  not allowed_cde_destination[input.attributes.destination.address.socketAddress.address]
  msg := sprintf("Egress from cards-cde to %v is not in the allow-list", [input.attributes.destination.address.socketAddress.address])
}

allowed_cde_destination = {
  "tokenisation-service.cards-cde.svc.cluster.local",
  "vault.security.svc.cluster.local",
  "hsm.security.svc.cluster.local",
}

# Vault detokenise: requires explicit purpose + valid PCI auth role.
deny[msg] {
  input.context == "vault.detokenise"
  not input.purpose
  msg := "Detokenise requires `purpose` (auth, settlement, dispute) — denied"
}

deny[msg] {
  input.context == "vault.detokenise"
  not input.auth.metadata.pci_dss_role
  msg := "Detokenise requires PCI-DSS-bound role — denied"
}

contains_pan(msg) {
  re_match(pan_pattern, msg)
}
