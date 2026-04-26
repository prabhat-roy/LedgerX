# Events — LedgerX

Kafka Avro event schemas — one schema per cross-domain event.

Topic naming: `{domain}.{entity}.{event}` — e.g. `payments.payment.captured`,
`core-banking.ledger.posted`, `cards.authorisation.approved`.

## Schema enforcement
Conduktor Gateway sits in front of the Kafka brokers and:
- Rejects messages that violate the registered Avro schema
- Strips / masks PII fields tagged `pii=true` for downstream consumers without entitlement
- Enforces tokenisation of card PANs (`tokenised=true`) at produce time

## Common envelope
Every event carries:
- `event_id` (UUID v7)
- `event_time` (timestamp-millis)
- `correlation_id` (request trace id)
- `actor_id` (nullable)
- `idempotency_key` (where the producing write was idempotent)
