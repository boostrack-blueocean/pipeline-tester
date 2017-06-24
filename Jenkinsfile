pipeline {
  agent {
    docker {
      image 'maven:3-alpine'
      label "maven-nodes"
      args "-v /tmp:/tmp"
    }
  }
  stages {
    stage('Build App') {
      agent {
        // Overrides the top-level agent. "agent none" at the stage level does nothing.
        label "maven-build-node"
      }
      steps {
        echo "This time, the Maven version"
        sh "mvn -version"
      }
    }
  }
}

