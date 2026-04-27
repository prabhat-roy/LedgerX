#!/usr/bin/env bash
set -euo pipefail
pact-provider-verifier https://pact-broker.ledgerx.internal \
  --provider ledgerx_identity_service \
  --provider-base-url http://identity-service.ledgerx.svc:50060 \
  --provider-version "${GIT_SHA:-local}" \
  --publish-verification-results
