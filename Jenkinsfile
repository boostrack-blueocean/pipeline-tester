pipeline {
  agent {
    dockerfile 'Dockerfile'
  }
  environment {
    AWS_ACCESS_KEY_ID=credentials('aws_access_key_id')
    AWS_SECRET_ACCESS_KEY=credentials('aws_secret_access_key')
    INHERITED_ENV = "${BUILD_NUM_ENV}"
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
        //sh 'aws s3 ls'
        sh 'echo $INHERITED_ENV'
      }
    }
  }
}
