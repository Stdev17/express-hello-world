pipeline {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("superb-flag-275605/hello-world")
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        // 별도 이미지 레지스트리를 등록해 주세요
        // GCR을 쓰시면 google container registry auth 플러그인을 깔아 주세요.
        // ECR을 쓰시면 Jenkins에 별도 Credential을 등록하셔야 합니다(액세스 ID, 시크릿과 함께)
        docker.withRegistry('https://gcr.io', 'gcr:my-credential-id') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}