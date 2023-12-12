FROM openjdk:8-jdk-alpine
RUN apt-get upgrade
RUN apt-get update
EXPOSE 8080
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} /home/k8s-pipeline/app.jar
ENTRYPOINT ["java","-jar","/app.jar"]