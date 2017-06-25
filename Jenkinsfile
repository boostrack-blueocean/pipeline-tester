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
    stage('Terraform') {
        sh 'ls -lah'
        docker.image('hashicorp/terraform:light').inside {
            try {
              sh 'terraform --version'
              sh 'terraform init'
              sh 'terraform plan'
            } catch (e) {
                println e
                echo 'This will run only if failed'
            }

        }
    }
    stage('NodeJS') {
        docker.image('node:8.1.2').inside {
            sh 'npm --version'
            try {
              sh 'npm install'
            } catch (e) {
                println e
                //echo 'This will run only if failed'
                return 0
            }
        }
    }
    
    stage('maven') {
        docker.image('maven:3.3.3').inside {
            sh 'mvn --version'
            try {
              sh 'mvn install'
            } catch (e) {
                println e
                //echo 'This will run only if failed'
                return 0
            }
        }
    }
 
 /*
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
*/
}
