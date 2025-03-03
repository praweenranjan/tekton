# Use a lightweight JDK runtime image for running the application
FROM docker.io/library/eclipse-temurin:21-jre

# Copy the built JAR file from the build stage
COPY ./target/tekton-0.0.1-SNAPSHOT.jar app.jar

# Expose application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
