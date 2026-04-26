pipeline {
  agent { kubernetes { yamlFile 'ci/jenkins/agent-pod.yaml' } }
  triggers { cron('H 2 * * *') }   // nightly
  stages {
    stage('Trivy filesystem') { steps { container('trivy') { sh 'trivy fs --severity HIGH,CRITICAL .' } } }
    stage('OPA conftest') {
      steps {
        container('conftest') {
          sh '''
            conftest test --policy security/opa/policies kubernetes/
            conftest test --policy security/opa/policies helm/charts/
          '''
        }
      }
    }
    stage('Kyverno test') { steps { container('kyverno') { sh 'kyverno test security/kyverno/' } } }
    stage('License scan') { steps { container('syft') { sh 'syft packages dir:src/ -o json > licenses.json' } } }
  }
}
