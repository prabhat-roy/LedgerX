# cards — LedgerX

Card issuance, authorisation, lifecycle, tokenisation. PCI-DSS scope.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| card-issuance | rust | 60060 | Card issuance + EMV personalisation (HSM-backed) |
| card-authorisation | rust | 60061 | ISO 8583 authorisation host |
| card-lifecycle | rust | 60062 | Card lifecycle (block/replace/PIN change) |
| virtual-card-service | rust | 60063 | Virtual / single-use card service |
| tokenisation-service | rust | 60064 | PAN tokenisation vault (HSM-adjacent) |
| scheme-settlement | go | 60065 | Card scheme settlement (Visa/Mastercard) |
| network-switch | go | 60066 | Network message switching (VAP/MAS) |
| three-ds-service | rust | 60067 | 3DS / SCA challenge service |
| chargeback-service | go | 60068 | Card disputes and chargeback workflow |
| wallet-provisioning | go | 60069 | Apple/Google Pay provisioning |
| bin-service | rust | 60070 | Card BIN routing and lookup |
| mcc-router | go | 60071 | Merchant category code router |

> Raw PAN never leaves the cardholder data environment (CDE). All inter-service calls
> use opaque tokens issued by `tokenisation-service`. Falco rules in `security/falco/`
> alert on any plaintext PAN read.
