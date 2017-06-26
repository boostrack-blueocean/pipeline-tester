node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }
    
    dir('grafana') {
        git url: 'https://github.com/grafana/grafana'
    }
    
 
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        sh 'docker run -a STDOUT -w /var/jenkins_home/workspace/cean_pipeline-tester_master-PIVAQTJ4QM7HJ5YJLF5TOXEED772VW2EYIONRQGL5USUQQOTCQLQ/grafana --volumes-from c883ed0cfba7517cbd5dde8b4a5d9330ee5b031f22450364327b79b3ba1ef704 golang:1.8 go run build.go setup'       
//        sh 'docker run --rm -v "$WORKSPACE/grafana":/go/src/github.com/grafana/grafana -w /go/src/github.com/grafana/grafana  golang:1.8 go run build.go build'

//        sh 'docker run -v "$WORKSPACE/grafana":/go/src/github.com/grafana/grafana -w /go/src/github.com/grafana/grafana node:6.11 npm install -g yarn'
//        sh 'docker run -v "$WORKSPACE/grafana":/go/src/github.com/grafana/grafana -w /go/src/github.com/grafana/grafana node:6.11 yarn install --pure-lockfile'
//        sh 'docker run -v "$WORKSPACE/grafana":/go/src/github.com/grafana/grafana -w /go/src/github.com/grafana/grafana node:6.11 npm run build'


//        app = docker.build("boostrack/debian-tools")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'java -version'
            try {
                sh 'terraform -version'
            } catch (Exception e) {
                println e
            }
            try {
                sh 'mvn -v'
            } catch (Exception e) {
                println e
            }
            try {
                sh 'node --version'
            } catch (Exception e) {
                println e
            }
        }
    }

}
