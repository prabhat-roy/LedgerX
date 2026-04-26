pipeline {
  agent {
    kubernetes {
      yamlFile 'ci/jenkins/agent-pod.yaml'
    }
  }
  parameters {
    string(name: 'SERVICE', defaultValue: 'ledger-service', description: 'Service to build')
    string(name: 'DOMAIN', defaultValue: 'core-banking', description: 'Domain folder under src/')
  }
  environment {
    REGISTRY = 'harbor.ledgerx.internal'
    IMAGE    = "${REGISTRY}/ledgerx/${params.SERVICE}"
    GIT_SHA  = "${GIT_COMMIT.take(7)}"
  }
  stages {
    stage('Lint + unit') {
      steps {
        container('builder') {
          sh "cd src/${params.DOMAIN}/${params.SERVICE} && make lint test"
        }
      }
    }
    stage('Build image') {
      steps {
        container('buildah') {
          sh """
            buildah bud -t ${IMAGE}:${GIT_SHA} -t ${IMAGE}:latest src/${params.DOMAIN}/${params.SERVICE}
          """
        }
      }
    }
    stage('SBOM + scan') {
      parallel {
        stage('SBOM') { steps { container('syft') { sh "syft ${IMAGE}:${GIT_SHA} -o spdx-json > sbom-${params.SERVICE}.json" } } }
        stage('Trivy') { steps { container('trivy') { sh "trivy image --severity CRITICAL,HIGH --exit-code 1 ${IMAGE}:${GIT_SHA}" } } }
        stage('Semgrep') { steps { container('semgrep') { sh "semgrep --config p/owasp-top-ten src/${params.DOMAIN}/${params.SERVICE}" } } }
        stage('Gitleaks') { steps { container('gitleaks') { sh "gitleaks detect --source src/${params.DOMAIN}/${params.SERVICE} --no-banner" } } }
      }
    }
    stage('Cosign sign') {
      steps {
        container('cosign') {
          withCredentials([file(credentialsId: 'cosign-key', variable: 'COSIGN_KEY')]) {
            sh "cosign sign --yes --key $COSIGN_KEY ${IMAGE}:${GIT_SHA}"
            sh "cosign attest --yes --key $COSIGN_KEY --predicate sbom-${params.SERVICE}.json --type spdx ${IMAGE}:${GIT_SHA}"
          }
        }
      }
    }
    stage('Push') {
      steps { container('buildah') { sh "buildah push ${IMAGE}:${GIT_SHA} && buildah push ${IMAGE}:latest" } }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: "sbom-${params.SERVICE}.json", fingerprint: true
    }
  }
}
