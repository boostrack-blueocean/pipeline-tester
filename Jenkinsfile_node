pipeline {
  agent { docker 'node:8.1.2' }
  stages {
    stage('build') {
      steps {
        sh 'npm --version'
        sh 'yarn --version'
        sh 'npm install'
      }
    }
  }
}
