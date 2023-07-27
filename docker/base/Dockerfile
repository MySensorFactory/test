FROM maven:3.8.4-eclipse-temurin-17-alpine as builder
COPY settings.xml /usr/share/maven/ref/
COPY pom.xml .
ENV CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain factory --domain-owner 781648067507 --region eu-central-1 --query authorizationToken --output text`
RUN mvn dependency:resolve -DskipTests