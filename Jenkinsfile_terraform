pipeline {
  agent { docker 'hashicorp/terraform:light' }
  stages {
    stage('build') {
      steps {
        //sh 'terraform --version'
        sh 'docker run -ti -u 1000:1000 -w /var/jenkins_home/workspace/cean_pipeline-tester_master-PIVAQTJ4QM7HJ5YJLF5TOXEED772VW2EYIONRQGL5USUQQOTCQLQ --volumes-from c883ed0cfba7517cbd5dde8b4a5d9330ee5b031f22450364327b79b3ba1ef704 hashicorp/terraform:light terraform --version'
      }
    }
  }
}
