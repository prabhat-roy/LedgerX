controller {
  name = "controller-1"
  database { url = "postgresql://boundary@postgres-boundary/ledgerx" }
}
worker {
  name = "worker-ledgerx-1"
  controllers = ["controller-1.boundary.ledgerx.internal"]
}
kms "awskms" {
  purpose = "root"
  key_id  = "alias/ledgerx-boundary"
}
