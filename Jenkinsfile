pipeline {
    agent { docker 'python:3.5.1' }
    stages {
        stage('build') {
            steps {
                sh 'python --version'
                sh 'python test.py'
                sh 'which pip'
                sh 'ls -lah'
                //sh 'pip install -r requirements.txt'
            }
        }
    }
}
