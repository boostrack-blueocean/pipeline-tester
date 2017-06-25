node {
    checkout scm
    stage('Build') {
        docker.image('php').inside {
            sh 'php --version'
        }
    }
}
