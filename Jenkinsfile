pipeline {
    agent {
        docker {
            dockerfile true
            label 'docker'
        }
    }
    stages {
        stage('Clone repository') {
            /* Let's make sure we have the repository cloned to our workspace */
            steps {
                checkout scm
            }
        }

        stage('Build image') {
            /* This builds the actual image; synonymous to
            * docker build on the command line */
            steps {
                script {
                    def app = docker.build("superb-flag-275605/hello-world":"${env.BUILD_NUMBER}")
                    docker.withRegistry('https://gcr.io', 'gcr:my-credential-id') {
                        app.push("latest")
                    }
                }
            }
        }
    }
}

