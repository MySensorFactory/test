FROM eclipse-temurin:17-jdk-jammy AS build

ARG SERVICE_NAME

COPY $SERVICE_NAME.jar /home
WORKDIR /home/