resource "vault_auth_backend" "k8s" {
  type = "kubernetes"
  path = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "k8s" {
  backend            = vault_auth_backend.k8s.path
  kubernetes_host    = "https://kubernetes.default.svc"
  kubernetes_ca_cert = file("/var/run/secrets/kubernetes.io/serviceaccount/ca.crt")
}

resource "vault_kubernetes_auth_backend_role" "ledger_service" {
  backend                          = vault_auth_backend.k8s.path
  role_name                        = "ledger-service"
  bound_service_account_names      = ["ledger-service"]
  bound_service_account_namespaces = ["ledgerx"]
  token_policies                   = ["ledger-service"]
  token_ttl                        = 3600
}

resource "vault_kubernetes_auth_backend_role" "card_issuance" {
  backend                          = vault_auth_backend.k8s.path
  role_name                        = "card-issuance"
  bound_service_account_names      = ["card-issuance"]
  bound_service_account_namespaces = ["cards-cde"]
  token_policies                   = ["card-issuance"]
  token_ttl                        = 1800
}

resource "vault_kubernetes_auth_backend_role" "tokenisation_service" {
  backend                          = vault_auth_backend.k8s.path
  role_name                        = "tokenisation-service"
  bound_service_account_names      = ["tokenisation-service"]
  bound_service_account_namespaces = ["cards-cde"]
  token_policies                   = ["tokenisation-service"]
  token_ttl                        = 600
}
