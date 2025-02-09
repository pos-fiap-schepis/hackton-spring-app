# Build the application
FROM maven:3.9.9-amazoncorretto-17 AS builder

WORKDIR /app

COPY . /app

RUN mvn clean install -DskipTests

# Deploy the application with required native libraries
FROM amazoncorretto:17

LABEL maintainer="Grupo 47"

WORKDIR /app

# Install dependencies including FFmpeg
RUN yum update -y && \
    yum install -y tomcat-native && \
    amazon-linux-extras enable epel && \
    yum install -y ffmpeg libavutil libavcodec libavformat && \
    yum clean all

# Copy application JAR from builder stage
COPY --from=builder /app/target/hackaton-0.0.1-SNAPSHOT.jar /app/hackaton-0.0.1-SNAPSHOT.jar

# Set entry point for the application
ENTRYPOINT ["java", "-jar", "hackaton-0.0.1-SNAPSHOT.jar"]

# Expose application port
EXPOSE 8080