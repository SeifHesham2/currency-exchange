pipeline {
    environment {
        dockerHome = tool 'myDocker'  // Ensure 'myDocker' tool is correctly configured
        mavenHome = tool 'myMaven'    // Ensure 'myMaven' tool is correctly configured
        PATH = "$dockerHome/bin:$mavenHome/bin:$PATH"
    }
    agent any
    stages {
      
        stage('Environment Setup') {
            steps {
                script {
                    sh 'mvn --version'  // Verify Maven version
                    sh 'docker version' // Verify Docker version
                    echo 'Environment variables:'
                    echo "PATH - $PATH"
                    echo "BUILD_NUMBER - ${env.BUILD_NUMBER}"
                    echo "BUILD_ID - ${env.BUILD_ID}"
                    echo "JOB_NAME - ${env.JOB_NAME}"
                    echo "BUILD_URL - ${env.BUILD_URL}"
                    echo "JOB_URL - ${env.JOB_URL}"
                    echo "BUILD_TAG - ${env.BUILD_TAG}"
                    echo "EXECUTOR_NUMBER - ${env.EXECUTOR_NUMBER}"
                    echo "NODE_NAME - ${env.NODE_NAME}"
                    echo "NODE_LABELS - ${env.NODE_LABELS}"
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

        stage('Integration Test') {
            steps {
                sh 'mvn failsafe:integration-test failsafe:verify'
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
