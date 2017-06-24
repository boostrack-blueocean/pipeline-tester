pipeline {
	agent {
		docker {
			label‘ docker - node’
			image‘ maven’
			args‘ - v / tmp: /tmp -p 80:80’
		}
	}
	environment {
		GIT_COMMITTER_NAME = ‘jenkins’
	}
	options {
		timeout(6, HOURS)
	}
	stages {
		stage(‘Build’) {
			steps {
				sh‘ mvn clean install’
			}
		}
		stage(‘Archive’) {
				when {
					branch‘ * /master’
				}
				steps {
					archive‘ * /target/ **
						/*’
						 junit ‘*/
						target / surefire - reports
					/*.xml’
					}
				}
					 }
					 post {
					 always {
					 deleteDir()
					 }
					 }
					}
