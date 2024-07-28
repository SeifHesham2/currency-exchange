pipeline {
   // agent any
   agent {docker {image 'maven:3.6.3'}}
   stages {
	  stage('Build') {
		 steps {
		    sh 'mvn --version'
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
	 success {
		echo 'I succeeded!'
	 }
	 failure {	
		echo 'I failed :('
	 }
	  }
   }

}
