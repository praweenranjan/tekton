# Use Maven image to build the application
FROM docker.io/library/maven:3.9.6-eclipse-temurin-21 AS build

# Set working directory inside container
WORKDIR /app

# Copy Maven project files
COPY pom.xml ./
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use a lightweight JDK runtime image for running the application
FROM eclipse-temurin:21-jre

# Set working directory
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/tekton-0.0.1-SNAPSHOT.jar app.jar

# Expose application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
