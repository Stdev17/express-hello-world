pipeline {
    agent {
        kubernetes {
            label 'hello-world'
            defaultContainer 'jnlp'
            yaml """
apiVersion: v1
kind: Pod
metadata:
labels:
  component: ci
spec:
  containers:
  - name: docker
    image: docker:latest
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: docker-sock
  volumes:
    - name: docker-sock
      hostPath:
        path: /var/run/docker.sock
"""
        }
    }
    stages {
        stage('Clone repository') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                container('docker') {
                // 이미지명 바꿔 주세요!!!
                    steps {
                        script {
                            def app = docker.build("superb-flag-275605/hello-world":"${env.BUILD_NUMBER}", "-f Dockerfile .")
                            docker.withRegistry('https://gcr.io', 'gcr:my-credential-id') {
                                app.push("latest")
                            }
                        }
                    }
                }
            }
        }
    }
}
