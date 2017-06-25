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
    stage('Python') {
        sh 'ls -lah'
        docker.image('python:2.7.13').inside {
            sh 'python --version'
            sh 'python test.py'
        }
    }
//    stage('Terraform') {
//        sh 'ls -lah'
//        docker.image('hashicorp/terraform:light').inside {
//            //sh 'terraform --version'
//            sh 'terraform plan'
//        }
//    }
}
