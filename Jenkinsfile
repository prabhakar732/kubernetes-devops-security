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
    
      stage('SonarQube - SAST') {
       steps {
         withSonarQubeEnv('sonarqube') {
           sh "mvn sonar:sonar -Dsonar.projectKey=kubernetes-devops-security -Dsonar.host.url=http://20.219.86.86:9000 -Dsonar.login=sqp_89c206484c679bb0c5bc5a36d5435f6b1a5ebf15"
         }
         timeout(time: 2, unit: 'MINUTES') {
           script {
             waitForQualityGate abortPipeline: true
          }
         }
       }
     }
    
    
        
        stage('Docker Build and Push') {
 		     steps {
 		     echo "before to docker"
         withDockerRegistry(credentialsId: "dockerhub", url: "") {
         echo "entered to docker"
           sh 'printenv'
           sh 'docker build -t prabhakar732/numeric-app:""$GIT_COMMIT"" .'
           sh 'docker push prabhakar732/numeric-app:""$GIT_COMMIT""'
         }
       }
        }
        
    }
}
