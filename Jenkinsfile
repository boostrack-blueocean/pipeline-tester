pipeline {
    //agent { docker 'python:3.5.1' }
    //agent { docker 'python:2.7.13' }
    //agent { docker 'debian:8.7' }
    agent { dockerfile 'Dockerfile' }
    stages {
        stage('build') {
            steps {
                sh 'apt-get update'
                sh 'apt-get install -y python-pip'
                sh 'python --version'
                sh 'python test.py'
                sh 'which pip'
                sh 'ls -lah'
                sh 'pwd'
                sh 'cat requirements.txt'
                sh 'pip install -r requirements.txt'
            }
        }
    }
}
