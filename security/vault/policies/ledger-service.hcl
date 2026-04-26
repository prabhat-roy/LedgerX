# ledger-service Vault policy.
# DB credentials are dynamic, leased for 60 minutes, auto-rotated.

path "database/creds/ledger-service-crdb" {
  capabilities = ["read"]
}

# Transit encryption for the ledger event-payload field-level encryption (KEK in HSM).
path "transit/encrypt/ledger-payload" {
  capabilities = ["create", "update"]
}

path "transit/decrypt/ledger-payload" {
  capabilities = ["create", "update"]
}

path "transit/keys/ledger-payload" {
  capabilities = ["read"]
}
