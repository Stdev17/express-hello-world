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
                sh """
                    docker build -t gcr.io/superb-flag-275605/hello-world .
                """
                sh """
                    docker tag gcr.io/superb-flag-275605/hello-world gcr.io/superb-flag-275605/hello-world:$BUILD_NUMBER
                """
                // GCR 기준입니다. ECR 등은 크레덴셜을 따로 마련하시길...
                sh """
                    cat keyfile.json | docker login -u _json_key --password-stdin https://gcr.io
                """
                sh """
                    docker push gcr.io/superb-flag-275605/hello-world
                """
                sh """
                    docker image prune -a -y
                """
                }
            }
        }
    }
}
