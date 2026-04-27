# Health check for all critical services
GET https://ledgerx.internal/healthz
HTTP 200
[Asserts]
jsonpath "$.status" == "ok"

GET https://api.ledgerx.internal/healthz
HTTP 200
[Asserts]
jsonpath "$.status" == "ok"
