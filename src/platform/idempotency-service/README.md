# idempotency-service

Idempotency-Key store and dedupe service (Redis-backed). All monetary writes
must include an `Idempotency-Key` header — duplicates return the original response.

**Domain:** `platform` · **Language:** go · **Port:** 60007
