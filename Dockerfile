# Stage 1: Build the application using Maven
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Create a lightweight image with only the necessary runtime
FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/Emp-System-1-0.0.1-SNAPSHOT.war /Emp-System-1.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/Emp-System-1.war"]
