node {
    
    def branchVersion = ""
    try {
//    buildNotify 'STARTED', 'my-build-channel'

    checkout scm
        
    stage('base docker image') {
      def app = docker.build(
        'boostrack/debian:tools',
        "--build-arg UID=1000 --build-arg GID=1000"
      )

      //app.push 'latest'
    }    
  
        
    stage('maven-custom') {
        sh 'docker run -a STDOUT -u 1000:1000 -w /var/jenkins_home/workspace/cean_pipeline-tester_master-PIVAQTJ4QM7HJ5YJLF5TOXEED772VW2EYIONRQGL5USUQQOTCQLQ --volumes-from c883ed0cfba7517cbd5dde8b4a5d9330ee5b031f22450364327b79b3ba1ef704 boostrack/debian:tools rm -rf ?/.m2'
        sh 'docker run -a STDOUT -u 1000:1000 -w /var/jenkins_home/workspace/cean_pipeline-tester_master-PIVAQTJ4QM7HJ5YJLF5TOXEED772VW2EYIONRQGL5USUQQOTCQLQ --volumes-from c883ed0cfba7517cbd5dde8b4a5d9330ee5b031f22450364327b79b3ba1ef704 boostrack/debian:tools mvn clean package'
    }
               
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
            try {
              sh 'pip install -r requirements.txt'
            } catch (e) {
                println e                
            } finally {
                //return 0
            }
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
            try {
                sh 'npm --version'
            } catch (e) {
                println e
                //echo 'This will run only if failed'
                //return 0
            }
            try {
              sh 'npm install'
            } catch (e) {
                println e
                //echo 'This will run only if failed'
                //return 0
            }
        }
    }
    
    stage('maven') {
        docker.image('maven:3-alpine').inside {
            
            sh 'ls -lah'
            
            try {
              sh 'mvn --version'
            } catch (e) {
                println e
                //echo 'This will run only if failed'
                //return 0
            }
            
            try {
                sh 'mvn package'
            } catch (e) {
                println e
                //echo 'This will run only if failed'
                
            } finally {
                //return 0
            }
        }
    }

    } catch(e) {
        currentBuild.result = "FAILED"
        throw e
    } finally {
       // buildNotify currentBuild.result, 'my-build-channel'
    }
}
