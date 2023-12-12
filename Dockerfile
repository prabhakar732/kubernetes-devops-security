FROM openjdk:8-jdk-alpine
EXPOSE 8080
RUN adduser testuser
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} /home/k8s-pipeline/app.jar
ENTRYPOINT ["java","-jar","/app.jar"]