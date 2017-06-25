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
            //sh 'mvn -version'
            //sh 'terraform -version'
            dir ('$WORKSPACE') { 

              sh 'test.sh'
            }
            sh 'terraform init'
//            sh 'terraform plan'
            returnStatus 0
          }
          /*,
          "test": {
            sh 'python --version'
            sh 'python test.py'
            sh 'which pip'
            sh 'ls -lah'
            sh 'pwd'
            sh 'cat requirements.txt'
            sh 'java -version'
            sh 'mvn -version'
            sh 'terraform -version'
            
          }
          */
        )
      }
    }
  }
}
