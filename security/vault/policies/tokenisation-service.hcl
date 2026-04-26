path "transit-hsm/encrypt/card-pan-kek" { capabilities = ["create", "update"] }
path "transit-hsm/decrypt/card-pan-kek" { capabilities = ["create", "update"] }

# Tokenise/Detokenise via Vault FPE engine.
path "fpe/encode/pan" { capabilities = ["create", "update"] }
path "fpe/decode/pan" { capabilities = ["create", "update"] }
