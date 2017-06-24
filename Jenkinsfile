pipeline {
  agent { docker 'hashicorp/terraform:light' }
  stages {
    stage('build') {
      steps {
        sh 'terraform --version'
      }
    }
  }
}
