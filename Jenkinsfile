pipeline {
  agent {
    docker {
      image 'maven:3-alpine'
    }  
  }
  stages {
    stage('Build App') {
      steps {
        sh 'mvn -B clean package'
        stash name: 'build', includes: 'target'
      }
    }
  }
}

