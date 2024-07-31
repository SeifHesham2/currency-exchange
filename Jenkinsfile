pipeline {
    environment {
        dockerHome = tool 'myDocker'
        mavenHome = tool 'myMaven'
        PATH = "${dockerHome}/bin:${mavenHome}/bin:${env.PATH}"
    }
    agent any
    stages {
        stage('Environment Setup') {
            steps {
                script {
                    echo 'Verifying Environment Setup...'
                    sh 'mvn --version'
                    sh 'docker --version'
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
                    docker.withRegistry('', 'DockerHub') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Install kubectl') {
            steps {
                script {
                    echo 'Installing kubectl...'
                    sh '''
                    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.30.3/bin/linux/amd64/kubectl
                    chmod +x ./kubectl
                    sudo mv ./kubectl /usr/local/bin/kubectl
                    '''
                }
            }
        }

        stage('Setup Minikube Context') {
            steps {
                script {
                    echo 'Setting up Minikube context...'
                    sh '''
                    minikube start
                    kubectl config use-context minikube
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    echo 'Deploying to Kubernetes...'
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl apply -f service.yaml'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    echo 'Verifying deployment...'
                    sh 'kubectl get pods'
                    sh 'kubectl get services'
                }
            }
        }
    }
    post {
        always {
            echo 'Finished'
        }
        success {
            echo 'Succeeded!'
        }
        failure {
            echo 'Failed'
        }
    }
}
