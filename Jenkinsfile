pipeline {
  agent {
    docker {
      image 'maven:3-alpine'
    }
    
  }
  stages {
    stage('Build App') {
      steps {
        sh 'echo "Build App"'
      }
    }
  }
}

