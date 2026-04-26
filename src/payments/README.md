# payments — LedgerX

Multi-rail payments behind a unified router. ISO 20022 / SWIFT / SEPA / UPI / ACH / RTP.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| payment-gateway | go | 60040 | Multi-rail payment gateway (PCI-DSS edge) |
| payment-router | go | 60041 | Smart payment router (cost+latency+success-rate optimisation) |
| swift-service | go | 60042 | ISO 20022 SWIFT MT/MX gpi service |
| sepa-service | go | 60043 | SEPA SCT/SCT-Inst/Direct Debit |
| upi-service | go | 60044 | UPI real-time rails (NPCI) |
| ach-service | go | 60045 | ACH (NACHA) and Fedwire |
| rtp-service | go | 60046 | FedNow / RTP instant payments |
| faster-payments-service | go | 60047 | Faster Payments (UK) |
| cross-border-service | go | 60048 | Cross-border FX leg coordination |
| payment-status-service | go | 60049 | Payment status tracking + webhook fan-out |
| bulk-payment-service | go | 60050 | Bulk file payments (PAIN.001/PAIN.008) |
| scheme-connector | go | 60051 | Payment scheme direct connectors |

> Every payment write must include an `Idempotency-Key`. Duplicates return the original response.
> The payment-router publishes `payments.payment.captured` events to Kafka.
