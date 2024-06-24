# Stage 1: Build the application using Maven
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests
# Debug step: List contents of the target directory
RUN ls -l /target

# Stage 2: Create a lightweight image with only the necessary runtime
FROM openjdk:17.0.1-jdk-slim
# Adjust the path based on where the WAR file is located
COPY --from=build /path/to/your/war/file.war /Emp-System-1.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/Emp-System-1.war"]
