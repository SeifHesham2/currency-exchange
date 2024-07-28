pipeline {
   agent { docker { image 'node:latest' } }

   stages {
      stage('Build') {
         steps {
            sh 'node --version'
            echo 'Building..'
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
