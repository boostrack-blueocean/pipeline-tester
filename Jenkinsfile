pipeline {
  agent {
    docker {
      image 'maven:3-alpine'
    }  
  }
  stages {
    stage('Build App') {
      steps {
        step {
          sh 'mvn -B clean package'
          stash name: 'build', includes: 'target'
        }
      }
    }
  }
}

