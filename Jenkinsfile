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
            
          },
          "package": {
            sh 'find /tmp -name \'*.sh\' -or -name \'*.tf\''
            
          }
        )
      }
    }
    stage('publish') {
      steps {
        sh 'aws s3 ls '
      }
    }
  }
}