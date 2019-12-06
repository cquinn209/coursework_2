pipeline {
          
      environment {
    registry = "cquinn209/coursework_2"
    registryCredential = 'dockerhub'
  }
          
         agent any
        
          stages {
                  
                  stage('Sonarqube') {
                   environment {
        scannerHome = tool 'SonarQubeScanner'
    }    
                       
        steps {
        withSonarQubeEnv('sonarqube') {
            sh "${scannerHome}/bin/sonar-scanner"
        }                                            
    }
      }
                    
   stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
   }
               
                  
                  stage('Three') {
                 when {
                       not {
                            branch "master"
                       }
                 }
                 steps {
                       echo "Hello"
                 }
                 }
                 stage('Four') {
                 parallel { 
                            stage('Unit Test') {
                           steps {
                                echo "Running the unit test..."
                           }
                           }
                            stage('Integration test') {
                              agent {
                                    docker {
                                            reuseNode true
                                            image 'ubuntu'
                                           }
                                    }
                              steps {
                                echo "Running the integration test..."
                              }
                           }
                           }
                           }
              }
}

