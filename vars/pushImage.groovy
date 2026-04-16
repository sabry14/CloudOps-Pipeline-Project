def call(String imageName) {
    withCredentials([usernamePassword(credentialsId: 'dockerhub', 
        usernameVariable: 'USER', passwordVariable: 'PASS')]) {
        sh "docker login -u $USER -p $PASS"
        sh "docker push ${imageName}"
    }
}
