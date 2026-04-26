# identity — LedgerX

Auth, users, MFA, SSO, device-trust, RBAC, PAM, SPIFFE.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| auth-service | rust | 60300 | FIDO2/WebAuthn auth + OAuth2 issuer |
| user-service | kotlin | 60301 | Customer + staff user directory |
| mfa-service | go | 60302 | MFA service (TOTP, WebAuthn, push) |
| session-service | go | 60303 | Session management (Redis) |
| device-trust-service | rust | 60304 | Device-trust + risk-aware login |
| role-service | kotlin | 60305 | RBAC + privilege grant service |
| customer-sso | rust | 60306 | Customer SSO (OIDC) |
| staff-sso | rust | 60307 | Staff SSO (SAML/OIDC + Teleport) |
| pam-service | kotlin | 60308 | Privileged access broker |
| spiffe-service | kotlin | 60309 | Service identity (SPIFFE/SPIRE) |
| impersonation-service | kotlin | 60310 | Customer impersonation (audited) |
| step-up-service | rust | 60311 | Step-up auth coordinator |
