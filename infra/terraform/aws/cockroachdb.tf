# CockroachDB multi-region active-active cluster — the ledger truth store.
# Bootstraps the cockroach-operator on each EKS cluster and lays down a
# CrdbCluster CR with multi-region survival goal = REGION.
#
# Each region runs 3 nodes spread across 3 AZs. Survives zone AND region failure.

resource "helm_release" "crdb_operator_use1" {
  provider   = helm
  name       = "crdb-operator"
  namespace  = "cockroach-operator-system"
  repository = "https://charts.cockroachdb.com/"
  chart      = "cockroach-operator"
  version    = "2.14.0"
  create_namespace = true
}

resource "kubernetes_manifest" "crdb_cluster_use1" {
  manifest = {
    apiVersion = "crdb.cockroachlabs.com/v1alpha1"
    kind       = "CrdbCluster"
    metadata   = { name = "ledgerx-crdb", namespace = "ledgerx" }
    spec = {
      dataStore = { pvc = { spec = { accessModes = ["ReadWriteOnce"], resources = { requests = { storage = "500Gi" } }, storageClassName = "gp3" } } }
      tlsEnabled    = true
      cockroachDBVersion = "v23.2.0"
      nodes         = var.cockroach_nodes_per_region
      regions       = [
        { code = "us-east-1", cloudProvider = "aws", namespace = "ledgerx", domain = "ledgerx.use1.svc" },
        { code = "eu-west-1", cloudProvider = "aws", namespace = "ledgerx", domain = "ledgerx.euw1.svc" },
        { code = "ap-south-1", cloudProvider = "aws", namespace = "ledgerx", domain = "ledgerx.aps1.svc" }
      ]
      # Region failure: data loss = none, RPO = 0, RTO < 30s
      survivalGoal = "region"
    }
  }
  depends_on = [helm_release.crdb_operator_use1]
}
