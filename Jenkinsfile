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
                    sh 'echo $PATH' // Verify PATH
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
                sh 'mvn test -X' // Add debug logging for tests
            }
        }
        stage('Integration Test') {
            steps {
                sh 'mvn failsafe:integration-test failsafe:verify -X' // Add debug logging for integration tests
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
