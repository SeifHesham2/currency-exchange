pipeline {
    agent any
    
    stages {
        stage('Package') {
            steps {
                script {
                    try {
                        sh 'mvn clean package'
                    } catch (Exception e) {
                        echo "Maven build failed: ${e.message}"
                        error("Maven build failed")
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        app = docker.build("in28minutes/docker-spring-boot:${env.BUILD_NUMBER}")
                    } catch (Exception e) {
                        echo "Docker build failed: ${e.message}"
                        error("Docker build failed")
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    try {
                        docker.withRegistry('', 'DockerHub') {
                            app.push()
                            app.push("latest")
                        }
                    } catch (Exception e) {
                        echo "Docker push failed: ${e.message}"
                        error("Docker push failed")
                    }
                }
            }
        }
    }
}
