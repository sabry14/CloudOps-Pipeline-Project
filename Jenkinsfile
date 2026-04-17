@Library('cloudops-shared-lib') _

pipeline {
    agent any
    environment {
        IMAGE_NAME = "mosabry159/cloudops-app:${BUILD_NUMBER}"
    }
    stages {
        stage('Build Image') {
            steps { buildImage(IMAGE_NAME) }
        }
        stage('Scan Image') {
            steps { scanImage(IMAGE_NAME) }
        }
        stage('Push Image') {
            steps { pushImage(IMAGE_NAME) }
        }
        stage('Delete Image Locally') {
            steps { deleteImage(IMAGE_NAME) }
        }
        stage('Update Manifests') {
            steps {
                sh "sed -i 's|image:.*|image: ${IMAGE_NAME}|' k8s/deployment.yaml"
            }
        }
	stage('Push Manifests') {
	    steps {
	        withCredentials([usernamePassword(credentialsId: 'github',
	            usernameVariable: 'USER', passwordVariable: 'PASS')]) {
	            sh """
	                git config user.email "ci@jenkins.com"
	                git config user.name "Jenkins"
	                git checkout main
	                git add k8s/deployment.yaml
	                git commit -m "Update image to ${IMAGE_NAME}"
	                git push https://\${PASS}@github.com/sabry14/CloudOps-Pipeline-Project.git HEAD:main
	            """
	        }
	    }
	}
                        
    }
}
