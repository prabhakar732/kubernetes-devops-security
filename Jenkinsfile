pipeline {
  agent any

  stages {
      stage('Build Artifact') {
            steps {
              sh "mvn clean package -DskipTests=true"
              archive 'target/*.jar' 
            }
        }  
       stage('unit test') {
            steps {
              sh "mvn test" 
            }
        }   
        stage('Jacaco test') {
            steps {
              sh "mvn test" 
            }
        post { 
        always { 
           junit 'target/surefire-reports/*.xml'
          jacoco execPattern: 'target/jacoco.exec'
             }
          } 
        }
        
        stage('Docker Build and push'){
           steps{
             sh 'printenv'
             sh 'docker build -t prabhakar732/numeric-app:"$GIT_COMMIT"'
             sh ' docker push prabhakar732/numeric-app:"$GIT_COMMIT"' 
           }
        }
        
    }
}