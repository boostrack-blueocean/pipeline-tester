node {
    checkout scm
    stage('Build') {
        docker.image('php').inside {
            sh 'php --version'
        }
    }
    stage('List') {
        sh 'ls -lah'
        sh 'php --version'
    }
}
