# Vault HSM-backed seal + Transit engine using AWS CloudHSM (PKCS#11).
# Key Encryption Keys (KEKs) for the ledger and PAN tokenisation NEVER leave the HSM.

seal "pkcs11" {
  lib            = "/opt/cloudhsm/lib/libcloudhsm_pkcs11.so"
  slot           = "1"
  pin            = "file:///vault/pkcs11.pin"
  key_label      = "ledgerx-vault-seal-kek"
  hmac_key_label = "ledgerx-vault-seal-hmac"
  generate_key   = "false"
}

# A second Transit engine specifically backed by HSM keys.
# Mounted at transit-hsm/.
# Used for: card-pan-kek, ledger-payload, fx-deal-kek.
