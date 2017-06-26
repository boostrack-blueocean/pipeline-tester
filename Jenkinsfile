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
        
        sh 'docker run --rm -v "$PWD/grafana":/go/src/github.com/grafana/grafana -w /go/src/github.com/grafana/grafana  golang:1.8 go run build.go setup'
        sh 'docker run --rm -v "$PWD/grafana":/go/src/github.com/grafana/grafana -w /go/src/github.com/grafana/grafana  golang:1.8 go run build.go build'

        sh 'docker run -v "$PWD/grafana":/go/src/github.com/grafana/grafana -w /go/src/github.com/grafana/grafana node:6.11 npm install -g yarn'
        sh 'docker run -v "$PWD/grafana":/go/src/github.com/grafana/grafana -w /go/src/github.com/grafana/grafana node:6.11 yarn install --pure-lockfile'
        sh 'docker run -v "$PWD/grafana":/go/src/github.com/grafana/grafana -w /go/src/github.com/grafana/grafana node:6.11 npm run build'


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
