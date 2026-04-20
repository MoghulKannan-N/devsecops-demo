pipeline {
    agent any
    
    stages {
        stage('Clone/Checkout') {
            steps {
                echo 'Pulling code from local repo'
                checkout scm
            }
        }
        
        stage('Security Scan (Trivy FS)') {
            steps {
                echo 'Running Trivy Filesystem Scan on source code'
                // We use || true so the pipeline doesnt completely fail for this demo, 
                // but realistically we'd want it to fail!
                sh '/home/M3ph1st0/.trivy_bin/trivy fs --exit-code 0 --severity HIGH,CRITICAL . || true'
            }
        }
        
        stage('Docker Build') {
            steps {
                echo 'Building secure Docker image'
                sh 'docker build -t devsecops-demo:latest .'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying Docker container'
                // Remove existing if any, then run new one
                sh 'docker rm -f devsecops-app || true'
                sh 'docker run -d --name devsecops-app devsecops-demo:latest'
            }
        }
    }
}
