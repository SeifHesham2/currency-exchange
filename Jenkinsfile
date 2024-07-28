pipeline {
   //agent { docker { image 'node:latest' } }
   agent any
   stages {
      stage('Build') {
         steps {
           // sh 'node --version'
            echo 'Building..'
            echo "$PATH"
            echo "BUILD_NUMBER - $env.BUILD_NUMBER"
            echo "BUILD_ID - $env.BUILD_ID" 
            echo "JOB_NAME - $env.JOB_NAME"
            echo "BUILD_URL - $env.BUILD_URL"
            echo "JOB_URL - $env.JOB_URL"
            echo "BUILD_TAG - $env.BUILD_TAG"
            echo "EXECUTOR_NUMBER - $env.EXECUTOR_NUMBER"
            echo "NODE_NAME - $env.NODE_NAME"
            echo "NODE_LABELS - $env.NODE_LABELS"
            echo "JENKINS_HOME - $env.JENKINS_HOME"
            echo "JENKINS_URL - $env.JENKINS_URL"
            echo "WORKSPACE - $env.WORKSPACE"
            echo "JOB_BASE_NAME - $env.JOB_BASE_NAME"
            echo "BUILD_NUMBER - $env.BUILD_NUMBER"
            echo "EXECUTOR_NUMBER - $env.EXECUTOR_NUMBER"
            echo "NODE_NAME - $env.NODE_NAME"
            echo "NODE_LABELS - $env.NODE_LABELS"
            echo "JENKINS_HOME - $env.JENKINS_HOME"
         }
      }
      stage('Test') {
         steps {
            echo 'Testing..'
         }
      }
      stage('Deploy') {
         steps {
            echo 'Deploying....'
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
