package ledgerx.admission

# Pod admission baseline: non-root, read-only root FS, drop ALL caps, signed image.

deny[msg] {
  input.request.kind.kind == "Pod"
  some i
  c := input.request.object.spec.containers[i]
  not c.securityContext.runAsNonRoot
  msg := sprintf("Container %v must runAsNonRoot=true", [c.name])
}

deny[msg] {
  input.request.kind.kind == "Pod"
  some i
  c := input.request.object.spec.containers[i]
  c.securityContext.allowPrivilegeEscalation
  msg := sprintf("Container %v must not allowPrivilegeEscalation", [c.name])
}

deny[msg] {
  input.request.kind.kind == "Pod"
  some i
  c := input.request.object.spec.containers[i]
  not c.securityContext.readOnlyRootFilesystem
  msg := sprintf("Container %v must readOnlyRootFilesystem=true", [c.name])
}

deny[msg] {
  input.request.kind.kind == "Pod"
  some i
  c := input.request.object.spec.containers[i]
  not startswith(c.image, "harbor.ledgerx.internal/")
  msg := sprintf("Container %v image %v must come from harbor.ledgerx.internal", [c.name, c.image])
}
