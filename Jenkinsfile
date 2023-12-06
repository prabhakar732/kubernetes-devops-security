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
        
         stage('Mutation Tests - PIT') {
     steps {
       sh "mvn org.pitest:pitest-maven:mutationCoverage"
      }
    }
        
        stage('Docker Build and Push') {
 		     steps {
         withDockerRegistry([credentialsId: "dockerhub", url: ""]) {
           sh 'printenv'
           sh 'sudo docker build -t prabhakar732/numeric-app:""$GIT_COMMIT"" .'
           sh 'docker push prabhakar732/numeric-app:""$GIT_COMMIT""'
         }
       }
        }
        
    }
}