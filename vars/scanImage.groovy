def call(String imageName) {
    sh "trivy image --exit-code 0 ${imageName}"
}
