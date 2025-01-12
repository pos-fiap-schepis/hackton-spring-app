# Build the application
FROM maven:3.9.9-amazoncorretto-23 AS builder

WORKDIR /app

COPY . /app

RUN mvn clean install -DskipTests

# Deploy the application with required native libraries
FROM amazoncorretto:23

LABEL maintainer="Grupo 47"

WORKDIR /app

RUN yum update -y && yum install -y tomcat-native

COPY --from=builder /app/target/hackton-0.0.1-SNAPSHOT.jar /app/hackton-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-jar", "hackton-0.0.1-SNAPSHOT.jar"]

EXPOSE 8080