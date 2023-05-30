# syntax=docker/dockerfile:1

FROM maven:3.9.2-eclipse-temurin-11

RUN mkdir -p /home/app
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package
RUN cp /home/app/target/*.war /home/app/ztti.war

FROM tomee:ubuntu
ENV FILE_NAME="JAAS-Seminarium-1.0-SNAPSHOT.war"
COPY jaas.config "/usr/local/tomee/conf/jaas.config"
ENV JAVA_OPTS="$JAVA_OPTS -Djava.security.auth.login.config==/usr/local/tomee/conf/jaas.config"

COPY --from=0 "/home/app/ztti.war" "/usr/local/tomee/webapps/$FILE_NAME"
EXPOSE 8080