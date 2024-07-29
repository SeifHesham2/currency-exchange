pipeline {
    environment {
        dockerHome = tool 'myDocker'  // Ensure 'myDocker' tool is correctly configured
        mavenHome = tool 'myMaven'    // Ensure 'myMaven' tool is correctly configured
        PATH = "${dockerHome}/bin:${mavenHome}/bin:${env.PATH}"
    }
    agent any
    stages {
        stage('Environment Setup') {
            steps {
                script {
                    echo 'Verifying Environment Setup...'
                    sh 'mvn --version'  // Verify Maven version
                    sh 'docker --version' // Verify Docker version
                    echo 'Environment variables:'           
                }
            }
        }

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    dockerImage = docker.build("seifseddik120/currencyexchange:${env.BUILD_NUMBER}")
                }        
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    echo 'Pushing Docker image to registry...'
                    docker.withRegistry('', 'dockerhub') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
    post {
        always {
            echo 'One way or another, I have finished'
        }
        success {
            echo 'I succeeded!'
        }
        failure {
            echo 'I failed :('
        }
    }
}
