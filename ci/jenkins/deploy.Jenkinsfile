pipeline {
  agent { kubernetes { yamlFile 'ci/jenkins/agent-pod.yaml' } }
  parameters {
    string(name: 'SERVICE', defaultValue: 'ledger-service')
    string(name: 'ENV',     defaultValue: 'staging', description: 'staging | prod')
    string(name: 'CLOUD',   defaultValue: 'aws',     description: 'aws | gcp | azure')
  }
  environment { COSIGN_PUB = credentials('cosign-public-key') }
  stages {
    stage('Verify image signature (Cosign)') {
      steps {
        container('cosign') {
          sh "cosign verify --key $COSIGN_PUB harbor.ledgerx.internal/ledgerx/${params.SERVICE}:latest"
        }
      }
    }
    stage('Two-person rule check (prod money-moving)') {
      when { expression { params.ENV == 'prod' && ['ledger-service', 'payment-router', 'settlement-service'].contains(params.SERVICE) } }
      steps {
        script {
          def approvers = sh(returnStdout: true, script: "gh pr view --json reviews -q '.reviews[].author.login'").trim().split('\n')
          if (approvers.size() < 2) { error("Two-person rule violated: ${params.SERVICE} prod deploy requires 2 approvers, got ${approvers.size()}") }
        }
      }
    }
    stage('GitOps PR') {
      steps {
        container('git') {
          sh "scripts/argocd-bump-image.sh ${params.SERVICE} ${env.GIT_COMMIT} ${params.ENV} ${params.CLOUD}"
        }
      }
    }
  }
}
