package ledgerx.admission

test_runs_non_root_required {
  count(deny) > 0 with input as {
    "request": { "kind": { "kind": "Pod" }, "object": { "spec": { "containers": [{ "name": "x", "image": "harbor.ledgerx.internal/x:1", "securityContext": {} }] } } }
  }
}

test_signed_image_passes {
  count(deny) == 0 with input as {
    "request": { "kind": { "kind": "Pod" }, "object": { "spec": { "containers": [{
      "name": "x", "image": "harbor.ledgerx.internal/x:1",
      "securityContext": { "runAsNonRoot": true, "readOnlyRootFilesystem": true, "allowPrivilegeEscalation": false }
    }] } } }
  }
}
