pipeline {
  stages {
    stage('Build App') {
      agent {
        docker {
          image 'maven:3-alpine'
        }  
      }
      steps {
        sh 'mvn -B clean package'
        stash name: 'build', includes: 'target'
      }
    }
  }
}

