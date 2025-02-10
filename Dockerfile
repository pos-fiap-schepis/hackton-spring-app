# Build the application
FROM maven:3.9.9-eclipse-temurin-17 AS builder

WORKDIR /app

COPY . /app

RUN mvn clean install -DskipTests

# Deploy the application with Ubuntu, Java 17, and FFmpeg
FROM ubuntu:latest

LABEL maintainer="Grupo 47"

WORKDIR /app

# Install dependencies (Java 17, FFmpeg, and required libraries)
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    ffmpeg \
    libavutil-dev \
    libavcodec-dev \
    libavformat-dev \
    && rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# Copy the built JAR file from the builder stage
COPY --from=builder /app/target/hackaton-0.0.1-SNAPSHOT.jar /app/hackaton-0.0.1-SNAPSHOT.jar

# Expose application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/hackaton-0.0.1-SNAPSHOT.jar"]