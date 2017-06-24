pipeline {
    agent { docker 'python:3.5.1' }
    stages {
        stage('build') {
            steps {
                sh 'python --version'
                sh 'python test.py'
                sh 'which pip'
                sh 'ls -lah'
                sh 'pwd'
                sh 'cat requirements.txt'
                sh '/usr/local/bin/pip install -r requirements.txt'
            }
        }
    }
}
