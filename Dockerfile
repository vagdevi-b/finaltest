# Dockerfile used to build a docker image and run springboot application in container.

FROM maven:3-eclipse-temurin-17
WORKDIR /app
RUN git clone https://github.com/vagdevi-b/springboot-petclinic.git
RUN mvn -f /app/spring-petclinic/pom.xml package
WORKDIR /app/spring-petclinic/target
ENTRYPOINT ["java","-jar","spring-petclinic-3.1.0-SNAPSHOT.jar"]