# idempotency-service

Idempotency-Key store and dedupe service (Redis-backed). All monetary writes
must include an `Idempotency-Key` header â€” duplicates return the original response.

Domain: `platform` Â· Language: go Â· Port: 60007
