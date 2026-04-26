# platform — LedgerX

Edge + cross-cutting concerns: gateway, BFFs, GraphQL, rate limiting, idempotency, sagas.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| api-gateway | go | 60000 | HTTP+gRPC ingress, OAuth2/mTLS, rate limiting, WAF integration |
| bff-retail | go | 60001 | BFF for retail customer mobile/web (React + Flutter) |
| bff-wealth | go | 60002 | BFF for wealth management portal (Angular) |
| bff-rm | go | 60003 | BFF for relationship-manager portal |
| bff-open-banking | go | 60004 | BFF for Open Banking (PSD2/FAPI) |
| graphql-gateway | go | 60005 | Federated GraphQL across domains |
| rate-limiter | go | 60006 | Distributed rate limiter (Redis Cell) |
| idempotency-service | go | 60007 | Idempotency-Key store and dedupe service |
| saga-orchestrator | go | 60008 | Saga orchestrator for cross-service money movement |
| mesh-controller | go | 60009 | Service-mesh sidecar config + traffic mirroring |
| config-proxy | go | 60010 | Internal config + feature-flag proxy |
| tenant-service | go | 60011 | Tenant isolation + entitlement service |
