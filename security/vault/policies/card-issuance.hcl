# card-issuance Vault policy — PCI-DSS scope.
# All KEKs live in HSM-backed Transit secrets engine.

path "transit-hsm/encrypt/card-pan-kek" {
  capabilities = ["create", "update"]
}

path "transit-hsm/decrypt/card-pan-kek" {
  capabilities = ["create", "update"]
}

# Read-only key metadata (rotation events).
path "transit-hsm/keys/card-pan-kek" {
  capabilities = ["read"]
}

# Forbid listing or exporting key material.
path "transit-hsm/keys/card-pan-kek/export" {
  capabilities = ["deny"]
}

path "transit-hsm/keys/+/export" {
  capabilities = ["deny"]
}
