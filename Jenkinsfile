pipeline {
  agent {
    dockerfile 'Dockerfile'
  }
  stages {
    stage('build') {
      steps {
        parallel(
          "build": {
            sh 'python --version'
            sh 'python test.py'
            sh 'which pip'
            sh 'ls -lah'
            sh 'pwd'
            sh 'cat requirements.txt'
            sh 'java -version'
            
          },
          "test": {
            pwd(tmp: true)
            
          }
        )
      }
    }
  }
}