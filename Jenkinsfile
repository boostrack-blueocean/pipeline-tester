pipeline {
  stages {
    agent {
      docker {
        image 'maven:3-alpine'
      }  
    }
    stage('Build App') {
      steps {
        sh 'mvn -B clean package'
        stash name: 'build', includes: 'target'
      }
    }
  }
}

