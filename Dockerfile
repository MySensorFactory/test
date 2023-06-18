FROM maven:3.8.2-eclipse-temurin-17 AS build

ARG SERVICE_NAME

COPY ./ /home
COPY /root/.m2/repository /home/.m2/repository
WORKDIR /home/
RUN mvn package -Dmaven.repo.local=/home/.m2/repository -pl $SERVICE_NAME -am

#
# Package stage
#
FROM eclipse-temurin:17-jdk-jammy
ARG SERVICE_NAME
COPY --from=build /home/$SERVICE_NAME/target/$SERVICE_NAME.jar /usr/local/lib/service.jar
ENTRYPOINT ["java","-jar", "/usr/local/lib/service.jar"]