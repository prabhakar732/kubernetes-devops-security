FROM openjdk:8-jdk-alpine
EXPOSE 8080
RUN adduser -u 1001 testuser
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} /home/k8s-pipeline/app.jar
ENTRYPOINT ["java","-jar","/app.jar"]