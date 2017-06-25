node {
    checkout scm
    stage('Build') {
        docker.image('php').inside {
            sh 'php --version'
        }
    }
    stage('List') {
        sh 'ls -lah'
        docker.image('php').inside {
            sh 'php --version'
            sh 'ls -lah'
            sh 'php php_info.php'
        }
    }
    stage('Terraform') {
        sh 'ls -lah'
        docker.image('hashcorp/terraform:lite').inside {
            sh 'terraform --version'
            sh 'terraform plan'
        }
    }
}
