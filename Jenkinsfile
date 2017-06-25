pipeline {
  agent {
    dockerfile 'Dockerfile'
  }
  environment {
    AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"
    INHERITED_ENV="${WORKSPACE}"
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
        sh 'which aws'
        sh 'echo ${AWS_ACCESS_KEY_ID} ${AWS_SECRET_ACCESS_KEY}'
        sh 'aws s3 ls'
      }
    }
  }
}
