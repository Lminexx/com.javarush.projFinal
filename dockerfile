FROM maven:3.8.4-openjdk-17 as builder
# COPY target/jira-1.0.jar ./jira-1.0.jar
# RUN mvn -f /app/pom.xml clean package -Dmaven.test.skip=true
COPY . /app
WORKDIR /app
RUN mvn clean package -Dmaven.test.skip=true

FROM eclipse-temurin:17-jre
WORKDIR /app
# COPY --from=builder /app/target/*.jar /app/*.jar
COPY --from=builder /app/target/*.jar /app/jira-1.0.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/jira-1.0.jar", "--spring.profiles.active=prod"]